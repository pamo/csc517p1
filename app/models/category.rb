class Category < ActiveRecord::Base
  has_many :posts
  validates :name, :presence => true, :uniqueness => true
  attr_accessible :name, :id

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search.gsub(/\s+/, "")}%")
    else
      scoped
    end
  end

end
