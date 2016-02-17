class User::PicturesController < ApplicationController

  def index
    @pictures = Picture.all(service)
  end

end
