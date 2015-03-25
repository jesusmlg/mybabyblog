class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by_nick(params[:session][:nick])
		if user && user.authenticate(params[:session][:password])
			log_in(user)
			redirect_to articles_path
		else
			flash.now[:danger] = "Contraseña incorrecta"
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to login_path
 	end
 	 	
end
