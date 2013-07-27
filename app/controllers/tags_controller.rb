class TagsController < ApplicationController
  respond_to :html, :json

  #Define Actions Here
  def new
  end

  def create
    respond_with Tag.create params[:tag]
  end

  def destroy
    respond_with Tag.destroy params[:id]
  end

end
