FactoryGirl.define do
  factory :post do
    user
    content   "Hello World"
    category_id  1
    votes

    factory :posts_with_votes do
      ignore do
        votes_count  0
      end

      after(:create) do |post, evaluator|
        FactoryGirl.create_list(:votes, evaluator.votes_count, post: post)
      end
    end
  end

end