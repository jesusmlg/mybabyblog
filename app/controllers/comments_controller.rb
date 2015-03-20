class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		@article = Article.find_by_id(params[:id])
	end

	def create
		@article = Article.find_by_id(params[:comment][:article_id])
		@comment = Comment.new(comment_params)
		if @comment.save
			flash.now[:success] = "Mensaje guardado"
		else
			flash.now[:danger] = "Error al guardar el mensaje"
		end

		redirect_to @article
	end

	private
		def comment_params
			params.require(:comment).permit(:nick,:comment,:article_id)
		end
end
