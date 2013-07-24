class SessionsController < ApplicationController

  # Define Filters here
  skip_before_filter :authenticate_user

  # Define Actions here
  def new
  end

  def create
    user = User.find_by_email params[:email]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      user.sign_in
      flash[:notice] = "Logged in successfully!!"
      redirect_to root_url
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully!!"
    redirect_to login_url
  end

end
