# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
1.times do |a|
  User.create(email: "site_admin1@ex.com",
              password: 'asdfasdf',
              password_confirmation: 'asdfasdf',
              first_name: "Site",
              last_name: "Admin")
end

puts "1 site admin created"
  
1.times do |a|
  User.create(email: "admin1@ex.com",
              password: 'asdfasdf',
              password_confirmation: 'asdfasdf',
              first_name: "Admin",
              last_name: "User")
end

puts "1 admin created"  

user = User.find(2)
user.add_role :admin

puts "Added admin role to first user"

5.times do |u|
  User.create(email: "user#{u+1}@ex.com",
              password: 'asdfasdf',
              password_confirmation: 'asdfasdf',
              first_name: "User",
              last_name: "User#{u}")
end

puts "#{User.count} users created"




