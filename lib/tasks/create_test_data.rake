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
    99.times do |n|
      name  = Faker::Name.name
      password = "password"
      password_confirmation  = "password"
      admin = false
      User.create!(:name => name,
                   :admin => false,
                   :password => password,
                   :password_confirmation => password)
    end
    end
  end
end
