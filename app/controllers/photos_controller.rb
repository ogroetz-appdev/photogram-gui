class PhotosController < ApplicationController
  def index
    @photos = Photo.all

    render({ :template => "photo_templates/photos.html.erb"})
  end
end
