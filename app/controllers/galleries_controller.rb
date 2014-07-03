class GalleriesController < ApplicationController
	def show
		@articles = Article.all
	end

end
