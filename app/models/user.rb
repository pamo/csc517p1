class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :admin
  has_many :posts
  has_many :comments, :through => :posts
  validates :name, :presence => true, :uniqueness => true

  validates :password, :confirmation => true
  validate  :password_must_be_present
  attr_accessor :password_confirmation, :password

  def User.authenticate(name, password)
    if user = find_by_name(name)
        user
    end
  end

  # 'password' is a virtual attribute
  def password=(password)
    @password = password
  end

  def password
    @password
  end

  after_destroy :ensure_an_admin_remains

  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
    if self.admin?
      raise "Can't delete admin"
    end
  end

  private

  def password_must_be_present
    errors.add(:password, "Missing password") unless password.present?
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search.gsub(/\s+/, "")}%")
    else
      scoped
    end
  end

end