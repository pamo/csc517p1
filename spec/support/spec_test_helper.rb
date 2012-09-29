module SpecTestHelper
  def login_admin
    login(:admin)
  end

  def login(user)
    puts "spec_test_helper login(#{user.name})"
    #session[:user_id] = user.id
    post "/sessions/new", :login => user.name, :password => user.password, :password_confirmation => user.password
  end

=begin
  def current_user
    User.find(session[:user_id])
  end
=end
end
