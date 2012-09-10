class Post < ActiveRecord::Base
  attr_accessible :category, :content, :username, :votes
  belongs_to :user
end
