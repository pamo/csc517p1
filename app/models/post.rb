class Post < ActiveRecord::Base
  attr_accessible :category, :content, :username, :votes

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['content LIKE ? OR category LIKE ?', search_condition, search_condition])
  end
end
