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
			flash[:success] = "Usuario editado correctamente"
			redirect_to edit_user_path @user
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
			if !logged_in?
				flash[:danger] = "Tienes que estar identificado como Administrador para acceder a esta zona"
				redirect_to login_path
			end
		end

		def is_jesusmlg?
			if current_user.nil? || current_user.nick != "jesusmlg"	
				flash[:danger] = "Tienes que ser el Webmaster para esta acción"
				redirect_to login_path
			end
		end

		def user_params
			params.require(:user).permit(:name, :email, :nick, :password, :password_confirmation,:userphoto)
		end

end
