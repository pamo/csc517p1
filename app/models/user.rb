class User < ActiveRecord::Base
  attr_accessible :password, :username, :usertype
end
