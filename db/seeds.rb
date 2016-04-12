# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
#include 'faker'

5.times do
  user = User.create!(
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

20.times do
  Item.create!(
    name: Faker::Hacker.say_something_smart,
    user: users.sample
  )
end


puts "Seeding Finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
