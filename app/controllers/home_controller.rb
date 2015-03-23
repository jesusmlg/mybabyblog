class HomeController < ApplicationController
  def index
    @imagenes = Image.first(9)
    @articles = Article.all.paginate(page: params[:page])
    @comments = Comment.all.last(9)
    @lastArticles = Article.where(baby_id: session[:baby]).first(10)
  end
end
