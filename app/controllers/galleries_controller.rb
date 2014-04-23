class GalleriesController < ApplicationController

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    @gallery.gallery_deviations.new(gallery_deviation_params)
  end

  private
  def gallery_params
    params.require(:gallery).permit(:title, :description, :user_id)
  end

  def gallery_deviation_params

  end
end