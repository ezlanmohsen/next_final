class GenericController < ApplicationController
	def landing
		if current_user
			redirect_to user_path(current_user)
		end
	end
end
