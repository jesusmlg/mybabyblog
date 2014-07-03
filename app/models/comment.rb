class Comment < ActiveRecord::Base
	belongs_to :article

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
