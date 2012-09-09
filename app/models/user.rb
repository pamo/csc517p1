class User < ActiveRecord::Base
  attr_accessible :UserName, :admin, :password
end
