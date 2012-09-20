Factory.define do
  factory :comment do
    user
    body   "Goodbye World"
    votes
    post

    factory :comment_with_votes do
      ignore do
        votes_count  0
      end

      after(:create) do |comment, evaluator|
        FactoryGirl.create_list(:votes, evaluator.comments_count, post: post)
      end
    end

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