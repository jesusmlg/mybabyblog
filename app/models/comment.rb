class Comment < ActiveRecord::Base
	belongs_to :article
	validates :nick, presence: true
	validates :comment, presence: true

	default_scope order('created_at DESC')

	def mydate
		created_at.strftime("%d/%m/%Y")
	end

	def comment_short
		words = 15
		miarray = self.comment.split(' ')
		if miarray.count<words then words = miarray.count end
		commentshort = ""
		words.times do |i|
			commentshort += miarray[i] + " "
		end

		 commentshort.html_safe
	end
	
end
