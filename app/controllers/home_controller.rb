class HomeController < ApplicationController
  def index
    @imagenes = Image.first(8)  
    @comments = Comment.last(6)
    @lastArticles = Article.first(6)
    @articles = Article.all.paginate(page: params[:page])
  end
end
