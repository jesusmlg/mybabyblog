class HomeController < ApplicationController
  def index
    @imagenes = Image.first(9)  
    @comments = Comment.last(9)
    @lastArticles = Article.first(10)
    @articles = Article.all.paginate(page: params[:page])
  end
end
