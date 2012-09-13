class Comment < ActiveRecord::Base
  attr_accessible :body, :postid, :username, :votes
  attr_reader :body, :postid, :username, :votes
  attr_writer :body, :postid, :username, :votes
  belongs_to :post
end
