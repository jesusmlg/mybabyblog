class ContactController < ApplicationController
	def new

	end

	def create
		@params = params[:contact]
		@name = params[:contact][:name]
		@msg = params[:contact][:msg]
		if params[:contact][:msg].blank? || params[:contact][:name].blank? 
			flash.now[:danger] = "Hay que rellenar nombre y mensaje "
			render 'new'
		else
			if !ContactMailer.contact_mailer(@name,@msg).deliver
				flash.now[:danger] = "Error al enviar el mensaje"
				render 'new'
			else
				flash[:success] = "Mensaje enviado correctamente"
				@params = nil
				redirect_to contacto_path
			end
			
			
		end
	end
end
