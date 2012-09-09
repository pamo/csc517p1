class User < ActiveRecord::Base
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

  private

  def password_must_be_present
    errors.add(:password, "Missing password")
  end

end