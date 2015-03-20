module ArticlesHelper
	def visitante
			flash[:success] = "holita"
			redirect_to home_path
	end
end
