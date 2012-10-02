FactoryGirl.define do
  factory :post do
    username  "JohnDoe"
    content   "Hello World"
    category_id  1
    votes   0
    id     1
  end

  factory :post2, class: Post do
    username  "Admin"
    content   "Hello World"
    category_id  2
    votes   0
    id     2
  end

end