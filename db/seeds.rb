# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
["Blog", "Event", "Question", "Announcement"].each do |cat|
  Category.find_or_create_by_name(cat)
end

User.delete_all
User.create(name:'Admin', password: 'admin', admin: true)
User.create(name:'Mary', password: 'mary', admin: false)
User.create(name:'Pam', password: 'pam', admin: true)
User.create(name:'Bot', password: 'bot', admin: false)
