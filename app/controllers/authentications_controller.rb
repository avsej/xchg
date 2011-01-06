class AuthenticationsController < ApplicationController
  def create
    oauth = request.env["rack.auth"].except("extra")
    oauth['user_info'] ||= {}
    user = User.find_or_initialize_by_email(oauth['user_info']['email'])
    user.name ||= oauth['user_info']['name']
    user.save
    session[:user_id] = user.id

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
