module SpecTestHelper
  def login_admin
    login(:admin)
  end

  def login(user)
    puts "spec_test_helper login(#{user.name})"
    #session[:user_id] = user.id
    session "/sessions/create", :username => user.name, :password => user.password
  end

=begin
  def current_user
    User.find(session[:user_id])
  end
=end
end
