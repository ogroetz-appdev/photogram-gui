class PhotosController < ApplicationController
  def index
    @photos = Photo.all

    render({ :template => "photo_templates/photos.html.erb" })
  end

  def show_detail
    @photo_id = params.fetch("id")
    @photo = Photo.where({ :id => @photo_id }).at(0)

    if (!@photo)
      redirect_to("/404")
    else
      render({ :template => "/photo_templates/photo_detail.html.erb" })
    end
  end

  def delete
    @photo_id = params.fetch("id")
    photo = Photo.where({ :id => @photo_id }).at(0)
    photo.destroy

    redirect_to("/photos")
  end
end
