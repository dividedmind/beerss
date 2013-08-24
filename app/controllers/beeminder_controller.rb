class BeeminderController < ApplicationController
  def show
    if !logged_in?
      redirect_to authorization_url
    else
      redirect_to root_path
    end
  end

  def callback
    User.find_or_create(username: params[:username]).update params.slice(:access_token)
    session[:username] = params['username']
    redirect_to root_path
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
