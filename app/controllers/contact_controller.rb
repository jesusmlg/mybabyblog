class ContactController < ApplicationController
	def new

	end

	def create
		@params = params[:contact]
		@name = params[:contact][:name]
		@msg = params[:contact][:msg]
		if params[:contact][:msg].blank? || params[:contact][:name].blank? 
			flash[:error] = "Hay que rellenar nombre y mensaje "
			render 'new'
		else
			if !ContactMailer.contact_mailer(@name,@msg).deliver
				flash[:error] = "email no enviado"
			else
				flash[:ok] = "Mensaje enviado correctamente"
				@params = nil
			end
			
			render 'new'
		end
	end
end
