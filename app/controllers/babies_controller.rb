class BabiesController < ApplicationController
	#before_action :is_visitant?, only: [:index]
	before_action :is_administrator?, only: [:edit,:create,:new,:destroy,:show,:index,:update]

	def new
		@baby = Baby.new
	end

	def create
		#@baby = Baby.new(baby_params)
		@baby = current_user.babies.build(baby_params)
		if @baby.save then
			flash.now[:ok] = "Bebé guardado correctamente "
			redirect_to parents_panel_path
		else
			flash.now[:error] = "Error al guardar el bebé"
			render 'new'
		end
	end

	def edit
		@baby = Baby.find(params[:id])
	end

	def update
		@baby = Baby.find(params[:id])
		
		if params[:baby][:password].blank?
			@baby.update_attributes(baby_params_sin_passwd)
			@baby.save
			flash[:ok] = "Bebé modificado correctamente"
		else
			if @baby.authenticate(params[:baby][:password_old])
				@baby.update_attributes(baby_params)
				flash[:ok] = "Bebé modificado correctamente, incluído el password"
			else
				flash[:error] = "La contraseña antigua no es correcta"
			end

			
		end
		redirect_to edit_baby_path(@baby)
	end

	def show
		session[:baby] = params[:id]
		@baby = Baby.find_by_id(params[:id])
		@articles = Article.all.where(baby_id: @baby.id)
		@no_readed_msgs = Comment.all.where(readed: false).count
	end


	private
		def baby_params
			params.require(:baby).permit(:name, :nick, :password , :password_confirmation, :description, :babyphoto)
		end

		def baby_params_sin_passwd
			params.require(:baby).permit(:name, :nick, :description, :babyphoto)
		end

		def is_visitant?
			if session[:visitant].nil?
				flash[:error] = "Tienes que estar identificado para acceder a esta zona"
				redirect_to home_path
			end
		end

		def is_administrator?
			if session[:user].nil?
				flash[:error] = "Tienes que estar identificado como Administrador para acceder a esta zona"
				redirect_to login_path
			end
		end
end
