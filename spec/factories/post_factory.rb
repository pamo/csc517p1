Factory.define do
  factory :post do
    user
    content   "Hello World"
    category_id  1
    votes  0
  end

  factory :user do
    user_name  "JohnDoe"

    factory :user_with_posts do

      ignore do
        posts_count  5
      end

      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:posts, evaluator.posts_count, user: user)
      end

    end
  end
end