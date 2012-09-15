class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments

  validates :user, :presence => true
  validates :category, :presence => true

  attr_accessible :category_id, :content, :username, :votes

end
