class Comment < ActiveRecord::Base
  attr_accessible :body, :postid, :username, :votes
  belongs_to :post
end
