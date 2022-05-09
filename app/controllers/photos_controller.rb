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

  def create
    new_photo = Photo.new
    new_photo.image = params.fetch("image")
    new_photo.caption = params.fetch("caption")
    new_photo.owner_id = params.fetch("owner_id")
    new_photo.save

    redirect_to("/photos/#{new_photo.id}")
  end

  def delete
    @photo_id = params.fetch("id")
    photo = Photo.where({ :id => @photo_id }).at(0)
    photo.destroy

    redirect_to("/photos")
  end
end
