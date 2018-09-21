class ProjectsController < ApplicationController
	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		@project.topic_id = 1 #placeholder for testing

		if @project.save
			byebug
			redirect_to user_path(current_user)
		else
			redirect_to root_path
			byebug
		end
	end



	private

	def project_params
  		params.require(:project).permit!
	end
end