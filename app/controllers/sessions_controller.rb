class SessionsController < ApplicationController
	def new
		#@user = User.new
	end

	def create
		user = User.find_by_nick(params[:session][:nick])
		if user && user.authenticate(params[:session][:password])
			session[:user] = user.nick
			sign_in(user.nick)
			redirect_to articles_path
		else
			flash.now[:danger] = "está mal la contraseña"
			render 'new'
		end
	end

	def destroy
		current_user = nil
		session[:user] = nil
		redirect_to login_path
 	end
end
