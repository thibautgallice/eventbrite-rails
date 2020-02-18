# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

50.times do
User.create(
  email: Faker::Internet.email,
  password: "123456",
  description: Faker::Hacker.say_something_smart,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)
puts "user created"
end

20.times do
Event.create(
  start_date: Faker::Time.forward(days: 60,  period: :evening, format: :long),
  admin: User.all.sample,
  title: Faker::Lorem.sentence(word_count: 3),
  description: Faker::Lorem.sentence(word_count: 25),
  price: Faker::Number.within(range: 50..300),
  duration: 60,
  location: Faker::Address.city
)
puts "Event created"
end

100.times do
  
  Attendance.create(user:User.all.sample,event:Event.all.sample)
  puts "Attendance created"

end
