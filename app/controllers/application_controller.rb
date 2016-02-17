class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :service

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def service
    @service ||= InstagramService.new(current_user)
  end

  def require_current_user
    render file: "./test/public/404" unless current_user
  end
end
