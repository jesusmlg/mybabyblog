class Article < ActiveRecord::Base
	validates :title , presence: true
	validates :body, presence: true

	has_many :comments, dependent: :destroy
	has_many :images, dependent: :destroy
	belongs_to :user
	accepts_nested_attributes_for :images

	default_scope order('created_at DESC')
	self.per_page = 5

	before_save :create_slug

	def to_param
		slug	
	end

	def body_html
		self.body = self.body.html_safe
	end

	def body_short
		words = 80
		miarray = self.body.split(' ')
		if miarray.count<words then words = miarray.count end
		bodyshort = ""
		words.times do |i|
			bodyshort += miarray[i] + " "
		end

		self.body = bodyshort.html_safe
	end

	def my_date
		if Rails.env.production? then self.created_at = self.created_at+2.hours end
		self.created_at.strftime("%d/%m/%Y")
	end

	def myDateFull
		if Rails.env.production? then self.created_at = self.created_at+2.hours end
		self.created_at.strftime("%d/%m/%Y %H:%M")
	end

	def create_slug
		today = Date.today.day.to_s + "-" + Date.today.month.to_s + "-" + Date.today.year.to_s + "-"
		self.slug = today+self.title.parameterize
	end
	
end
