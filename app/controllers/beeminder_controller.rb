class BeeminderController < ApplicationController
  def show
    if !logged_in?
      redirect_to authorization_url
    else
      redirect_to root_path
    end
  end

  def callback
    user = User.of_access_token params['access_token']
    if user
      session[:username] = user.username
      redirect_to root_path
    else
      render text: 'Wrong authorization', status: 401
    end
  end
  
  private
  def authorization_url
    "https://www.beeminder.com/apps/authorize?client_id=#{client_id}&redirect_uri=#{callback_uri}&response_type=token"
  end
  
  def client_id
    @client_id ||= ENV['BEEMINDER_CLIENT_ID']
  end
  
  def callback_uri
    CGI::escape(url_for controller: 'beeminder', action: 'callback')
  end
end
