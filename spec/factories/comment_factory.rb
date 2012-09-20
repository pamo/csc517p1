FactoryGirl.define do
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

end