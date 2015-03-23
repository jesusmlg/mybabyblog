class ArticlesController < ApplicationController
	#before_action :is_visitant?, only: [:show,:index]
	before_action :is_administrator?, only: [:edit,:create,:new,:destroy,:update,:delete]

	def new
		@article = Article.new

	end

	def create
		first = true
		@article = Article.new(article_params)
		if @article.save then
				if params[:article][:newimg]
					params[:article][:newimg].each do |file|
						@img = @article.images.create(:newimg => file)
						if first
							@img.update_attributes(main: true)
							first = false
						end
					end			    
				end

			flash.now[:success] = "Artículo guardado correctamente "
			redirect_to articles_path 
		else
			flash.now[:danger] = "Error al guardar el artículo"
			render 'new'
		end
	end

	def show
		@article = Article.find_by_slug(params[:id])
		@comment = Comment.new
		@comments = @article.comments.order("created_at DESC").paginate(page: params[:page])
	end

	def index

		 @articles = Article.all.paginate(page: params[:page])
	end

	def edit
		@article = Article.find_by_slug(params[:id])
	end

	def update
		@article = Article.find_by_slug(params[:id])

		if @article.update_attributes(article_params)
			if params[:article][:newimg]
				params[:article][:newimg].each do |file|
					@article.images.create(:newimg => file)
				end
			end	
			flash.now[:success] = "Artículo modificado correctamente"
		else
			flash.now[:danger] = "Error al modificar el artículo"
		end


		redirect_to edit_article_path(@article)
	end

	def destroy
		if Article.find_by_slug(params[:id]).destroy
			flash.now[:success] = "Artículo eliminado correctamente"
		else
			flash.now[:danger] = "Error al borrar el artículo"
		end
		
		redirect_to admin_path
	end

	private
		def is_visitant?
			if session[:visitant].nil?
				flash[:danger] = "Tienes que estar identificado para acceder a esta zona"
				redirect_to home_path
			end
		end

		def is_administrator?
			if session[:user].nil?
				flash[:danger] = "Tienes que estar identificado como Administrador para acceder a esta zona"
				redirect_to login_path
			end
		end



		def article_params
			params.require(:article).permit(:title, :body, :newimg, :baby_id, :user_id, :priv)
		end

end
