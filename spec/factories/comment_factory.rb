FactoryGirl.define do
  factory :comment do
    username    "Admin"
    body        "Goodbye World"
    votes       0
    post_id     1

    #factory :comment_with_votes do
    #  ignore do
    #    votes_count  0
    #  end
    #
    #  after(:create) do |comment, evaluator|
    #    FactoryGirl.create_list(:votes, evaluator.comments_count, post: post)
    #  end
    #end

  end

end