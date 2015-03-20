class ImagesController < ApplicationController
	#before_action :is_visitant?, only: [:show,:index]
	before_action :is_administrator?, only: [:edit,:create,:new,:destroy]

	def index
		#@articles = Article.all.where(baby_id: session[:baby])
		
		@images = Image.joins('LEFT OUTER JOIN articles on articles.id = images.article_id').where("articles.baby_id = ?", session[:baby]).order("created_at DESC").paginate(page: params[:page])
	end
	
	def destroy
		Image.find(params[:id]).destroy
		redirect_to :back
	end

	def show
		@image = Image.find(params[:id])
	end

	def update
		@image = Image.find(params[:id])
		@images_main = Image.all.where(article_id: @image.article_id)

		@images_main.each do |img| 
			img.update_attributes(main: false)
		end

		if @image.update_attributes(main: true)
			
			flash[:success] = "Imagen marcada como principal"
			redirect_to :back
		end
	end

	private

		def image_params
			params.require(:image).permit(:newimg, :id)
		end

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
end
