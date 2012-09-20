Factory.define do
  factory :category do
      name  "cool"
      post
  end

  factory :post do
    user_name  "JohnDoe"

    factory :post_with_category do
      ignore do
        post_category  "cool"
      end

      after(:create) do |category, evaluator|
        FactoryGirl.create_list(:post, evaluator.post_category, category: category)
      end
    end
  end
end