class GiftsController < ApplicationController
	def new
		@gift = Gift.new
	end

	def create
		@gift = Gift.new(gift_params)
		if @gift.save then
			flash.now[:ok] = "Regalo guardado correctamente "
			redirect_to gifts_path
		else
			flash.now[:error] = "Error al guardar el regalo"
			render 'new'
		end
	end

	def index
		@gifts = Gift.where(baby_id: session[:baby])
	end

	def edit
		@gift = Gift.find(params[:id])
	end

	def update
		@gift = Gift.find(params[:id])
		
		if @gift.update_attributes(gift_params) then
			flash.now[:ok] = "Regalo editado correctamente "
			redirect_to gifts_path
		else
			flash.now[:error] = "Error al editar el regalo"
			render 'edit'
		end
	end

	private
		def gift_params
			params.require(:gift).permit(:name,:checked,:person,:baby_id)
		end
end
