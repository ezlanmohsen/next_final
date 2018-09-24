class AssignmentsController < ApplicationController
	def create
		@assignment = Assignment.new(assignment_params)
		@project = Project.find(assignment_params[:project_id])
		if @assignment.save
			byebug
			if @project.unassigned?
				@project.assigned!
			end
			redirect_back(fallback_location: root_path)
		else
			redirect_to '/admin'
		end
	end

	def show
		@ass = Assignment.find(params[:id])
		if current_user.id != @ass.user.id
			redirect_to user_path(current_user)
		end
		@points = Point.last(10)
		#refer to method in model
	    if params[:reset]
	      @points = Point.last(10)
	    elsif params[:search_name]
	      @points = Point.search(params[:search_name], params[:search_topic], params[:search_year], params[:search_admin_likes])
	    else
	      @points = Point.last(10)
	    end
	end


	private

	def assignment_params
  		params.require(:assignment).permit!
	end
end

