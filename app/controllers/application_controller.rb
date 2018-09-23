class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	#@current_user is @current_user or User.find(by session user id)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  #Allows us to use @current_user at all view files
  helper_method :current_user

  # Allow us to use authorize before_action at controller
  def authorize
    redirect_to root_path unless current_user
  end

    # Allow us to use same_user in user controller
  def same_user
    redirect_to user_path(current_user) unless (current_user.id == params[:id].to_i || current_user.superadmin?)
  end

end
