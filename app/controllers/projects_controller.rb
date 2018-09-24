class ProjectsController < ApplicationController
	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		# @project.topic_id = 1 #placeholder for testing
		if @project.save
			redirect_to user_path(current_user)
		else
			redirect_to root_path
		end
	end

	def index
  		if current_user.superadmin?
			@projects = Project.all
			@assignment = Assignment.new
		else
			redirect_to user_path(current_user)
		end
	end

	private

	def project_params
  		params.require(:project).permit!
	end
end