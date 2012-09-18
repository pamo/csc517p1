class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id, :username, :votes, :post
  validates :body, :username, :post_id, :presence => true
  belongs_to :post

  def self.search(search)
    if search
      where('body LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
