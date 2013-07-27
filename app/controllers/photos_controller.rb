class PhotosController < ApplicationController

  respond_to :html, :json

  def create
    @photo = Photo.create params[:photo]
    unless @photo.new_record?
      flash[:notice] = "New Photo Added Successfully"
      redirect_to @photo.album
    end
  end

  def destroy
    Photo.destroy(params[:id])
    flash[:notice] = "Photo deleted Successfully!!"
    redirect_to :back
  end

end
