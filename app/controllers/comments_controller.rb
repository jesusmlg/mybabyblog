class CommentsController < ApplicationController
	before_action :is_administrator?, only: [:edit,:update,:delete,:destroy]

	def new
		@comment = Comment.new
		@article = Article.find_by_id(params[:id])
	end

	def create
		@article = Article.find_by_id(params[:comment][:article_id])
		@comment = Comment.new(comment_params)
		#if params[:comment][:secret_word] == ApplicationHelper::SECRET_WORD
			if @comment.save
				flash[:success] = "Mensaje guardado"
				redirect_to articulo_path @article
			else
				flash[:danger] = "Error al guardar el mensaje, no puede haber ningún campo vacío"
				redirect_to articulo_path @article
			end			
		# else
		# 	flash.now[:danger] = "La palabra secreta no es correcta"
		# 	render 'articles/show'
		# end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@article = @comment.article

		if @comment.destroy
			flash[:success] = "Mensaje eliminado correctamente"
		else
			flash[:danger] = "Error al eliminar el Mensaje"
		end

		redirect_to edit_article_path @article

	end

	private

		def is_administrator?
			if !logged_in?
				flash[:danger] = "Tienes que estar identificado como Administrador para acceder a esta zona"
				redirect_to login_path
			end
		end

		def comment_params
			params.require(:comment).permit(:nick,:comment,:article_id,:secret_word)
		end
end
