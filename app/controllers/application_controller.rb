class ApplicationController < ActionController::Base
  before_filter :authorize

  helper_method :current_user, :logged_in?

  def logged_in?
    current_user != nil
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authorize
    unless logged_in?
      redirect_to login_url, :notice => "Please log in"
    end
  end
end