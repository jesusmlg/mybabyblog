class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		@article = Article.find_by_id(params[:id])
	end

	def create
		@article = Article.find_by_id(params[:comment][:article_id])
		@comment = Comment.new(comment_params)
		if params[:comment][:secret_word] == ApplicationHelper::SECRET_WORD
			if @comment.save
				flash.now[:success] = "Mensaje guardado"
				redirect_to @article
			else
				flash.now[:danger] = "Error al guardar el mensaje, no puede haber ningún campo vacío"
				redirect_to @article
			end			
		else
			flash.now[:danger] = "La palabra secreta no es correcta"
			render 'articles/show'
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:nick,:comment,:article_id,:secret_word)
		end
end
