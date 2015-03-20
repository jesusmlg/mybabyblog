class Article < ActiveRecord::Base
	validates :title , presence: true
	validates :body, presence: true

	has_many :comments, dependent: :destroy
	has_many :images, dependent: :destroy
	belongs_to :user
	accepts_nested_attributes_for :images

	self.per_page = 5

	def body_html
		self.body = self.body.html_safe
	end

	def body_short
		words = 40
		miarray = self.body.split(' ')
		if miarray.count<words then words = miarray.count end
		bodyshort = ""
		words.times do |i|
			bodyshort += miarray[i] + " "
		end

		self.body = bodyshort.html_safe
	end

	def my_date
		created_at.strftime("%d/%m/%Y")
	end
	
end
