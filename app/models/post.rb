class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments

  validates :username, :category_id, :content, :presence => true

  attr_accessible :category_id, :content, :username, :votes

  def self.search(search)
    if search
      puts search
      postCategory = Category.where('name LIKE ?', search).first()
      puts postCategory.name
      catID = postCategory.id
      puts catID
      where('content LIKE ? OR username LIKE ? OR category_id = ?', "%#{search}%", "%#{search}%", catID)
    else
      scoped
    end
  end



end
