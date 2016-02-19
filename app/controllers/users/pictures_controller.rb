class Users::PicturesController < ApplicationController
  def show
    @picture = Picture.find(service, params[:id])
    @comments = Picture.pic_comments(service, params[:id])
    @likes = Picture.pic_likes(service, params[:id])
  end

end
