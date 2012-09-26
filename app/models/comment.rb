class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id, :username, :votes, :post
  validates :body, :username, :post_id, :presence => true
  belongs_to :post,:touch => true

  def self.search(search)
    if search
      where('body LIKE ? OR username LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

end
