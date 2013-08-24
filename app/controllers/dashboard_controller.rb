class DashboardController < ApplicationController
  def index
    if logged_in?
      render text: "Hello, #{current_user.username}"
    else
      redirect_to beeminder_path
    end
  end
end
