class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :admin

  validates :name, :presence => true, :uniqueness => true

  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader   :password

  validate  :password_must_be_present

  def User.authenticate(name, password)
    if user = find_by_name(name)
        user
    end
  end

  # 'password' is a virtual attribute
  def password=(password)
    @password = password
  end

  after_destroy :ensure_an_admin_remains

  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
  end

  private

  def password_must_be_present
    errors.add(:password, "Missing password") unless password.present?
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['username LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end