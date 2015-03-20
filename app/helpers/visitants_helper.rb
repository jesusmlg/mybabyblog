module VisitantsHelper
	def is_visitant?
		if session[:visitant].nil?
			flash[:danger] = "Tienes que estar identificado para entrar en esta sección"
			redirect_to home
		end

	end
end
