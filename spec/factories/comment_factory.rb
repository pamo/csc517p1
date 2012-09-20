Factory.define do
  factory :comment do
    user
    body   "Goodbye World"
    post_id
    votes  0
    post

  end

  factory :user do
    user_name  "Admin"
  end

  factory :post do
      user_name  "JohnDoe"

    factory :post_with_comments do

      ignore do
        comments_count  2
      end

      after(:create) do |post, evaluator|
        FactoryGirl.create_list(:comments, evaluator.comments_count, post: post)
      end

    end
  end
end