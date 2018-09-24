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
	end


	private

	def assignment_params
  		params.require(:assignment).permit!
	end
end
