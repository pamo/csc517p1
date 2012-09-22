module SpecTestHelper
  def login_admin
    login(:admin)
  end

  def login(user)
    puts "spec_test_helper login(#{user.name})"
    session[:user_id] = user.id
  end

  def current_user
    User.find(session[:user_id])
  end
end
