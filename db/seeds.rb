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

Post.delete_all
Post.create(id: '1', username: 'Admin', content:'Test post by admin', votes: '0', category_id: '1')
Post.create(id: '2', username: 'Bot', content:'Scooby Dooby doo!', votes: '0', category_id: '3')
Post.create(id: '3', username: 'Admin', content:'I can edit this post', votes: '0', category_id: '2')
Post.create(id: '1', username: 'Pam', content:'Today is Wednesday', votes: '0', category_id: '1')

Comment.delete_all
Comment.create(post_id: '1', username: 'Mary', body: 'This is really funny!', votes: '0')