class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments

  validates :username, :category_id, :content, :presence => true

  attr_accessible :category_id, :content, :username, :votes

  def self.search(search)
    if search
      postCategory = Category.find_by_name('#{search}')
      catID = postCategory.object_id
      where('content LIKE ? OR username LIKE ? OR category_id LIKE ?', "%#{search}%", "%#{search}%", "%#{catID}%")
    else
      scoped
    end
  end



end
