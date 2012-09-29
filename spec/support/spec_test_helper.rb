module SpecTestHelper
  def login_admin
    login(:admin)
  end

  def login(user)
    @user = User.where(:username => user.to_s).first if user.is_a?(Symbol)
    request.session[:user_id] = user.id
  end

  def logout(user)
    @user = User.where(:username => user.to_s).first if user.is_a?(Symbol)
    session[:user_id] = nil
  end

  def current_user
    User.find(session[:user_id])
  end

end
