class AlbumsController < ApplicationController
  respond_to :html, :json

  # Define Actions Here
  def index
    respond_with @albums = current_user.albums
  end

end
