class AlbumsController < ApplicationController
  respond_to :html, :json, :js

  # Define Actions Here
  def index
    respond_with @albums = current_user.albums.page(params[:page]).per(8)
  end

  def new
    respond_with @album = current_user.albums.new
  end

  def create
    @album = current_user.albums.new(params[:album])

    respond_to do |format|
      if @album.save
        format.html do
          flash[:notice] = "Album Created Successfully"
          redirect_to @album
       end
        format.json {render json: @album}
      else
        flash[:error] = "Error creating album - " + @album.errors.full_messages.join(", ")
        render 'new'
      end
    end
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos
    respond_with @album, @photos
  end

  def destroy
    flash[:notice] = "Album deleted Successfully!!"
    respond_with Album.destroy(params[:id])
  end

  def update
    @album = Album.find params[:id]

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to(:back, :notice => 'Album was successfully updated.') }
        format.json { respond_with_bip(@album) }
      else
        format.html { redirect_to :back }
        format.json { respond_with_bip(@album) }
      end
    end
  end

end
