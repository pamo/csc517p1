class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments

  validates :username, :presence => true
  validates :category, :presence => true
  validates :content, :presence => true

  attr_accessible :category_id, :content, :username, :votes

  def self.search(search)
    if search
      where('content LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
