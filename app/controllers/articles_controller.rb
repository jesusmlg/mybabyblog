class ArticlesController < ApplicationController
	#before_action :is_visitant?, only: [:show,:index]
	before_action :is_administrator?, only: [:edit,:create,:new,:destroy,:update,:delete,:index]

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
			flash[:success] = "Artículo modificado correctamente"
			redirect_to articles_path
		else
			flash.now[:danger] = "Error al modificar el artículo"
			render 'edit'
		end

		
	end

	def destroy
		if Article.find_by_slug(params[:id]).destroy
			flash.now[:success] = "Artículo eliminado correctamente"
		else
			flash.now[:danger] = "Error al borrar el artículo"
		end
		
		redirect_to articles_path
	end

	def fill

		titles = ["Artículo sobre los nueve meses","Esto es una prueba de relleno de articulos",
							"Esto es un titular de noticia",
							"Esta es la noticia más impresionantes que he visto",
							"Bienvenidos a mi nuevo blog!!!!",
							"Como ganar más tiempo para dormir"]				
			body = "Quisque sed blandit ex, non convallis leo. Maecenas vel maximus mauris. Suspendisse leo enim, varius id est ut, ornare ornare risus. Pellentesque aliquam ullamcorper velit, dictum interdum diam molestie sit amet. Nullam bibendum scelerisque augue, vel dapibus eros auctor ut. Morbi consequat maximus mattis. Nullam tempus accumsan ex, non placerat libero. Duis vel dapibus neque. Sed feugiat mi sapien, in rutrum diam ultricies ut.
							Aenean at neque in nisi lobortis pretium a finibus orci. Morbi fermentum arcu ante, sed efficitur ex facilisis eget. Fusce fermentum ut nunc ac eleifend. Nunc euismod diam quis porta cursus. Vivamus laoreet felis suscipit tincidunt elementum. Donec id porta ex, at euismod justo. Suspendisse potenti. Donec diam sapien, condimentum quis ipsum ut, posuere venenatis urna. Aliquam faucibus nunc eget cursus lobortis. Cras imperdiet orci quis leo hendrerit dictum. Sed gravida ullamcorper sapien in iaculis.
							Nunc faucibus justo eu nunc cursus fermentum. Cras malesuada ornare mattis. Vestibulum imperdiet ac lectus at mattis. Donec sit amet auctor enim, vel semper leo. Vivamus a quam vitae justo aliquam molestie non a turpis. Quisque sed tristique tortor. Quisque elementum mauris risus, sed pharetra massa tristique ut. Pellentesque accumsan, velit ac mollis tempus, metus mi congue purus, non pellentesque elit risus non tortor."
		for i in 1..20
			@article = Article.new
			@article.title = titles[Random.new.rand(0..4)]
			@article.body = body
			@article.user_id = Random.new.rand(1..2)
			@article.save
		end

		@articles= Article.all

		@articles.each do |art|
			people = ['Jesús', 'Irene','Guadalupe', 'Paloma', 'Vicente', 'Antonio', 'Alejandro', 'Hugo', 'Martina', 'Cire'] 
			comments =[ 'Es un comentario muy bonito el que está puesto',
									'Los comentarios deberían ser más variados',
									'Como se encuentra los padres de la criatura',
									'Esto es un nuevo comentario de prueba autogenerado',
									'Más y más comentarios para las pruebas de autogeneración',
									'Este es el último comentario que genero'
								]
			for i in 0..(Random.new.rand(1..4))
				@comment = Comment.new
				@comment.nick = people[Random.new.rand(0..9)]
				@comment.comment = comments[Random.new.rand(0..5)]
				@comment.article_id = art.id
				@comment.save
			end
			
		end
		redirect_to articles_path
	end

	private

		def is_administrator?
			if !logged_in?
				flash[:danger] = "Tienes que estar identificado como Administrador para acceder a esta zona"
				redirect_to login_path
			end
		end

		def article_params
			params.require(:article).permit(:title, :body, :newimg, :baby_id, :user_id, :priv)
		end

end
