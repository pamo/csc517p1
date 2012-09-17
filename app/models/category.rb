class Category < ActiveRecord::Base
  has_many :posts
  validates :name, :presence => true
  attr_accessible :name

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
