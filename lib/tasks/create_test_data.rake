namespace :db do
  task :fake_user_data => :environment do
    require 'faker'

  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Test User",
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

    Post.create!(:name =>"Test User",
                 :content => "content body",
                 :category => "Category",
                 :votes => 0)
    end
  end
end
