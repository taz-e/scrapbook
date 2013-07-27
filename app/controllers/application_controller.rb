class ApplicationController < ActionController::Base
  protect_from_forgery

  # Define filters here
  before_filter :authenticate_user


  # Define private methods here
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user
    unless current_user
      flash[:alert] = "Please login or signup to continue!!"
      redirect_to login_url
    end
  end

end
