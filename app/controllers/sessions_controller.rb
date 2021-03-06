class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      if user[:admin]
        redirect_to admin_url
      else
        redirect_to posts_url
      end

    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_url, :notice => "You've been logged out. Goodbye."
  end
end
