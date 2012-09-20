require 'faker'

# This will guess the User class

FactoryGirl.define do
  factory :user do
    user_name "JohnDoe"
    password  "password"
    password_confirmation "password"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    user_name "Admin"
    password  "admin"
    password_confirmation  "admin"
    admin      true
  end
end

built_users   = FactoryGirl.build_list(:user, 25)
created_users = FactoryGirl.create_list(:user, 25)
built_admins = FactoryGirl.build_list(:admin, 10)
created_admins = FactoryGirl.create_list(:admin, 10)
