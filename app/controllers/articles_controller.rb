class ArticlesController < ApplicationController
	#before_action :is_visitant?, only: [:show,:index]
	before_action :is_administrator?, only: [:edit,:create,:new,:destroy]


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

			flash[:success] = "Artículo guardado correctamente "
			redirect_to baby_path(session[:baby]) 
		else
			flas[:error] = "Error al guardar el articulo"
			render 'new'
		end
	end

	def show
		@article = Article.find_by_id(params[:id])
		@comment = Comment.new
		@comments = @article.comments.order("created_at DESC").paginate(page: params[:page])
	end

	def index
		if session[:user].nil?
			priv = false 
		else
			priv = true
		end

		#session[:baby] = Baby.find(1)

		@imagenes = Image.all
		@articles = Article.all.paginate(page: params[:page])
		@comments = Comment.joins('LEFT OUTER JOIN articles on articles.id = comments.article_id').where("articles.baby_id = ?", session[:baby]).order("created_at DESC").limit(9)
		@lastArticles = Article.where(baby_id: session[:baby]).last(10)
	end

	def edit
		#session[:return_to] ||= request.referer ESTO ES PARA QUEDARSE EN QUE PÁGINA ESTABA ANTES DE IR A LA SIGUIENTE
		#redirect_to session.delete(:return_to)

		@article = Article.find(params[:id])

	end

	def update
		@article = Article.find(params[:id])

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
		@baby = Baby.find(session[:baby])
		Article.find(params[:id]).destroy
		redirect_to @baby
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
