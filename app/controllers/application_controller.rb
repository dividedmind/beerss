class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !current_user.nil?
  end
  
  def current_user
    @user ||= User[session[:username]] rescue nil
  end
end
