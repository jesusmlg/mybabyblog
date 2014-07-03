class PanelsController < ApplicationController
	def visitors
	end

	def parents
		@babies = Baby.all.where(user_id: current_user.id)
	end

	def baby
	end
end
