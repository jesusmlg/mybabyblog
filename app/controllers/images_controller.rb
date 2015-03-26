class ImagesController < ApplicationController
	#before_action :is_visitant?, only: [:show,:index]
	before_action :is_administrator?, only: [:edit,:create,:new,:destroy,:update,:delete]

	def index
		@images = Image.all.paginate(page: params[:page])
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

		def is_administrator?
			if !logged_in?
				flash[:danger] = "Tienes que estar identificado como Administrador para acceder a esta zona"
				redirect_to login_path
			end
		end
end
