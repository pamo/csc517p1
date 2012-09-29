module SpecTestHelper
  def login_admin
    login(:admin)
  end

  def login(user)
=begin
    puts "spec_test_helper login(#{user.name})"
    #session[:user_id] = user.id
    session "/sessions/create", :username => user.name, :password => user.password
=end
    user = User.where(:username => user.to_s).first if user.is_a?(Symbol)
    request.session[:user] = user.id
  end

=begin
  def current_user
    User.find(session[:user_id])
  end
=end
end
