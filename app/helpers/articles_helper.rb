module ArticlesHelper
	def visitante
			flash[:ok] = "holita"
			redirect_to home_path
	end
end
