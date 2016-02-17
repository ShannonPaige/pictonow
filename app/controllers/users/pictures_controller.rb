class Users::PicturesController < ApplicationController
  def index
    @pictures = Pictures.all(current_user)
  end

end
