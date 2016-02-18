class UsersController < ApplicationController
  def show
    @user_data = User.profile(service)
    @pictures = Picture.all(service)
  end

end
