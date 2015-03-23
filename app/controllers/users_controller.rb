class UsersController < ApplicationController
	before_action :is_administrator?, only: [:edit,:show,:index,:update]
	before_action :is_jesusmlg?, only:[:new,:destroy,:delete,:create]

	def new
		@user = User.new
	end

	def edit
		@user = User.find_by_nick(params[:id])
	end

	def update
		@user = User.find_by_nick(params[:id])

		if @user.update_attributes(user_params)
			flash.now[:success] = "Usuario editado correctamente"
			render 'edit'
		else
			flash.now[:danger] = "Problema al guardar el usuario"
			render 'edit'
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Guardado ok"
			render 'new'
		else
			flash[:danger] = "Error al guardar"
			render 'new'
		end
	end

	def show
		@user = User.find_by_nick(params[:id])
	end

	def index
		@user = User.paginate(page: params[:page])
	end

	private
		def is_administrator?
			if session[:user].nil?
				flash[:danger] = "Tienes que estar identificado como Administrador para acceder a esta zona"
				redirect_to login_path
			end
		end

		def is_jesusmlg?
			if session[:user]!= "jesusmlg"	
				flash[:danger] = "Tienes que ser el Webmaster para esta acción"
				redirect_to login_path
			end
		end

		def user_params
			params.require(:user).permit(:name, :email, :nick, :password, :password_confirmation,:userphoto)
		end

		def signed_in_user
			unless signed_in?
				#store_location
				redirect_to login_url, notice: "Por favor ingrese primero sus datos."
			end
		end
end
