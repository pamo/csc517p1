class ApplicationController < ActionController::Base
  before_filter :authorize

  helper_method :current_user, :logged_in?, :not_current_user?

  def logged_in?
    current_user != nil
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authorize
    unless logged_in?
      redirect_to login_url, :alert => "Please log in"
    end
  end

  def is_admin?
    unless logged_in? && current_user.admin
      redirect_to home_url, :alert => "Please log in as admin"
    end
  end

  def not_current_user?(user)
    puts "in not..."
    puts current_user.name
    puts user
    current_user.name != user
  end
end