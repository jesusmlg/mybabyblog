class ParentsController < ApplicationController
	def index
		@parents = Baby.find(session[:baby])
	end

	def new
		@parents = Baby.find(session[:baby])
	end

	def create
		@parents = Baby.find(session[:baby])

		if @parents.update_attributes(parents_params)
			flash[:success] = "Padres editados correctamente"
			
			render 'new'
		else
			flash[:danger] = "Error al editar los padres"
			render 'new'
		end	
	end

	def update
		@parents = Baby.find(session[:baby])
		if @parents.update_attributes(parents_params)
			flash[:success] = "Padres  correctamente"
			render 'edit'
		else
			flash[:danger] = "Error al  los padres"
			render 'edit'
		end	
	end

	def edit
		@parents = Baby.find(session[:baby])
		if @parents.update_attributes(parents_params)
			flash[:success] = "Padres creados correctamente"
			redirect_to parents_path
		else
			flash[:danger] = "Error al crear los padres"
			redirect_to 'new'
		end	
	end

	private
		def parents_params
			params.require(:parent).permit(:parent1_name,:parent2_name,:parent1_desc,:parent2_desc,:how_we_met,:parent1_photo,:parent2_photo)
		end
end
