class PhotosController < ApplicationController
  respond_to :html, :json

  # Define Actions Here
  def create
    @album = Album.find params[:album_id]
    @photo = @album.photos.create params[:photo]
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

  def update
    @photo = Photo.find params[:id]

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to(:back, :notice => 'Tags Added Successfully.') }
        format.json { respond_with_bip(@photo) }
      else
        format.html { redirect_to :back }
        format.json { respond_with_bip(@photo) }
      end
    end
  end
end
