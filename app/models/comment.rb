class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id, :username, :votes, :post
  attr_reader :body, :post_id, :username, :votes
  attr_writer :body, :post_id, :username, :votes
  belongs_to :post
end
