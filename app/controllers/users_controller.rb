class UsersController < ApplicationController

	before_action :authorize, :except => [:new, :create, :index]

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
  		redirect_to new_user_path
	end

	def show
		@user = User.find(params[:id])
		if @user.first_name == nil || @user.last_name == nil || @user.occupation == nil || @user.industry == nil
			redirect_to edit_user_path(@user)
		end
	end

	def edit
		
	end

	private

	def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
