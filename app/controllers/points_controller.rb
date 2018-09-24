class PointsController < ApplicationController
	def index
		@points = Point.all
	end

	def create
		@point = Point.new(point_params)
		@point.user_id = current_user.id
		if @point.save
			redirect_back(fallback_location: root_path)
		else
			redirect_to user_path(current_user)
		end
		
	end

	private

	def point_params
  		params.require(:point).permit!
	end
end
