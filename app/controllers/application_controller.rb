class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :signed_in?

  def current_user
    unless defined?(@current_user)
      @current_user ||= User.find_by_id(session[:user_id])
    end
    @current_user
  end

  def signed_in?
    !!current_user
  end
end
