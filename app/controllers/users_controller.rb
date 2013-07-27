class UsersController < ApplicationController
  respond_to :html, :json

  # Define Filters here
  before_filter :authorize_resource  # Basic Authorization
  skip_before_filter :authenticate_user, only: [:new, :create]

  # Define Actions here
  def new
    respond_with @user = User.new
  end

  def create
    @user = User.new params[:user]
    
    if @user.save
      session[:user_id] = @user.id
      @user.sign_in
      flash[:notice] = "Signed Up Successfully!!"
      redirect_to root_url
    else
      flash[:error] = "Error signing up user - " + @user.errors.full_messages.join(", ")
      render "new"
    end
  end

  def edit
    respond_with @user = User.find(params[:id])
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes(params[:user])
      flash[:notice] = "User updated Successfully!!"
      redirect_to root_url
    else
      flash[:error] = "Error editing user - " + @user.errors.full_messages.join(", ")
      render 'new'
    end
  end

  # Define Private methods here
  private

  def authorize_resource
    if params[:id] && params[:id].to_i != @current_user.id
      flash[:alert] = "Operation not Authorized!!!"
      redirect_to root_url
    end
  end

end
