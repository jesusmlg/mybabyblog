class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:ok] = "Guardado ok"
			render 'new'
		else
			flash[:error] = "Error al guardar"
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
