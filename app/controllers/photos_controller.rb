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

  def update
    id = params.fetch("id")
    photo = Photo.where({ :id => id }).at(0)
    photo.image = params.fetch("image")
    photo.caption = params.fetch("caption")
    photo.save

    redirect_to("/photos/#{photo.id}")
  end

  def delete
    @photo_id = params.fetch("id")
    photo = Photo.where({ :id => @photo_id }).at(0)
    photo.destroy

    redirect_to("/photos")
  end

  def add_comment
    new_comment = Comment.new
    new_comment.author_id = params.fetch("author_id")
    new_comment.photo_id = params.fetch("photo_id")
    new_comment.body = params.fetch("comment")
    new_comment.save

    redirect_to("/photos/#{new_comment.photo_id}")
  end
end
