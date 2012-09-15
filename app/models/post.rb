class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments

  validates :title, :presence => true
  validates :user, :presence => true
  validates :category, :presence => true

  attr_accessible :category, :content, :username, :votes

end
