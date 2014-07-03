class SessionsController < ApplicationController
	def new
		#@user = User.new
	end

	def create
		user = User.find_by_nick(params[:session][:nick])
		if user && user.authenticate(params[:session][:password])
			#flash.now[:ok] = "El usuario existe"
			session[:visitant] = nil
			session[:user] = user.nick
			sign_in(user.nick)
			redirect_to parents_panel_path
		else
			flash.now[:error] = "está mal la contraseña"
			render 'new'
		end
	end

	def destroy
		current_user = nil
		session[:user] = nil
		redirect_to login_path
 	end
end
