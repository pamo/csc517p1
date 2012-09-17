class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id, :username, :votes, :post
  #attr_reader :body, :post_id, :username, :votes
  #attr_writer :body, :post_id, :username, :votes
  belongs_to :post

  def self.search(search)
    if search
      where('body LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
