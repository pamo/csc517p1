
# This will guess the User class

FactoryGirl.define do
  factory :user do
    name "JohnDoe"
    password  "password"
    password_confirmation "password"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    name "Admin"
    password  "admin"
    password_confirmation  "admin"
    admin      true
  end
end

