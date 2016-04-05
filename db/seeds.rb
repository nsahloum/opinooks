# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.create!(name:  "Example User",
#         	 email: "example@railstutorial.org",
#              password:              "foobarfoobar",
#              password_confirmation: "foobarfoobar")

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "passwordpassword"
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password)
end
users = User.order(:created_at).take(10)
12.times do
  title = Faker::Lorem.sentence(5)
  description = Faker::Lorem.sentence(5)
  users.each { |user| user.debats.create!(description: description, title: title) }
end