class User::BaseController < ApplicationController
  before_action :require_current_user
end
