User.destroy_all
Project.destroy_all
Comment.destroy_all
StatusHistory.destroy_all

users = User.create!([
  { email: 'user1@example.com',name: "user1", password: 'password', password_confirmation: "password" },
  { email: 'user2@example.com', name: "user2" ,password: 'password1', password_confirmation: "password1"}
])

projects = Project.create!([
  { name: 'Project Alpha', status: 'not_started' },
  { name: 'Project Beta', status: 'in_progress' }
])

comments = Comment.create!([
  { content: 'This is the first comment.', user: users.first, project: projects.first },
  { content: 'Another comment here.', user: users.last, project: projects.last }
])

status_histories = StatusHistory.create!([
  { old_status: 'not_started', new_status: 'in_progress', user: users.first, project: projects.first },
  { old_status: 'in_progress', new_status: 'completed', user: users.last, project: projects.last }
])

puts 'Seed data successfully created!'# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
