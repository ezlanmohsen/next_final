class UsersController < ApplicationController

	before_action :authorize, :except => [:new, :create, :index]
	before_action :same_user, :except => [:new, :create, :index]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render "new"
		end
	end

	def index
  		#short term fix if user refresh upon failed sign in
  		if current_user == nil
  			redirect_to new_user_path
  		else
  			if current_user.superadmin?
  				@users = User.all
  			else
  				redirect_to user_path(current_user)
  			end
  		end

	end

	def show
		@user = User.find(params[:id])
		if @user.first_name == nil || @user.last_name == nil || @user.occupation == nil || @user.industry == nil || @user.mobile == nil
			redirect_to edit_user_path(@user)
		end
		@project = Project.new
		@projects = Project.where(user_id: @user.id)
		@assignments = Assignment.where(user_id: @user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
  		@user = User.find(params[:id])
	  	if @user.update(user_params)
	  		redirect_to user_profile_path(@user)
	  	else
  			render 'edit'
  		end
    end

    def profile
    end

	private

	def user_params
  		params.require(:user).permit!
	end
end
