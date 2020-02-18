# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all



User.create(
  email: "th1@yopmail.com",
  # encrypted_password: "123456",
  description: Faker::Hacker.say_something_smart,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)
puts "user 1"

User.create(
  email: "th2@yopmail.com",
  # encrypted_password: "123456",
  description: Faker::Hacker.say_something_smart,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)
puts "user 2"

e = Event.create(
  start_date: Time.now,
  admin: User.all.sample,
  title: "zezerrez rz",
  description: "hrzekaze akejazkejna zea zjnae alzne alzknealnze",
  price: 300,
  duration: 5,
  location: "Paris"
)

a = Attendance.create(user:User.last.id,event:Event.last.id)