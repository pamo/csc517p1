namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(:name => "User",
                 :password => "foobar",
                 :password_confirmation => "foobar",
                 :admin => false)
    20.times do |n|
      name  = Faker::Internet.user_name
      password = "password"
      password_confirmation  = "password"
      admin = (1 == rand(2) ? true : false)
      User.create!(:name => name,
                   :admin => false,
                   :password => password,
                   :password_confirmation => password)
    end

    Category.create(:name => "Category")
    5.times do |n|
      name = Faker::Company.name
      Category.create!(:name => name)
    end

    Post.create!(:username =>"Test User",
                 :content => "content body",
                 :category_id => "1",
                 :votes => 0)
    5.times do |n|
      username = User.find_by_id(rand(20)).name
      content = Faker::Lorem.sentences(3)
      category_id = rand(5)
      votes = 0
      Post.create!(:username => username,
                   :content => content,
                   :category_id => category_id,
                   :votes => votes)
    end

    Comment.create!(:username =>"Test User",
                    :body => "content body",
                    :post_id => "1",
                    :votes => 0)
    5.times do |n|
      username = User.find_by_id(rand(20)).name
      body = Faker::Lorem.sentences(3)
      post_id = rand(5)
      votes = 0
      Comment.create!(:username => username,
                   :body => body,
                   :post_id => post_id,
                   :votes => votes)
    end
  end
end
