
# This will guess the User class

FactoryGirl.define do
  factory :user do
    name "JohnDoe"
    password  "password"
    password_confirmation "password"
    id  1
    admin false

  end

  factory :user2, class: User do
    name "JaneDoe"
    password  "password2"
    password_confirmation "password2"
    id  4
    admin false

  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    name "admin"
    password  "admin"
    password_confirmation  "admin"
    id  2
    admin  true
  end

  factory :admin2, class: User do
    name "AdminJoe"
    password  "admin2"
    password_confirmation  "admin2"
    id  3
    admin  true
  end

  #factory :session_user, class: Session do
  #  name "JohnDoe"
  #  password "password"
  #  password_confirmation "password"
  #  admin false
  #end

end

