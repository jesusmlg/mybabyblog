class VisitantsController < ApplicationController
	

	def new
		#@user = User.new
	end

	def create
		baby = Baby.find_by_nick(params[:visitants][:nick])
		if baby && baby.authenticate(params[:visitants][:password])
			#flash.now[:success] = "El bebé existe"
			session[:user] = nil
			session[:visitant] = baby.id * 2345
			session[:baby] = baby.id
			redirect_to articles_path
		else
			flash.now[:danger] = "está mal la contraseña"
			render 'new'
		end
	end

	def destroy
		session[:visitant] = nil
		session[:baby] = nil
		redirect_to home_path
 	end
end
