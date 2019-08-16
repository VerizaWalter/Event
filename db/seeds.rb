# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destruction de users"
User.destroy_all
puts "destruction evenement"
Event.destroy_all
puts "destru participation"
Attendance.destroy_all


require 'faker'
puts "creation user"
10.times do
  user = User.create(email: Faker::Internet.email, description: Faker::Lorem.sentence, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: Faker::Internet.password)
end
puts "creation event"
5.times do
  event = Event.new(start_date: DateTime.now + 5.days, duration: 5, title: Faker::Music.album, description: Faker::Lorem.sentence, price: 5, location: Faker::Address.city)
  event.admin = User.all.sample
  event.save
end
puts "creation attendance"
10.times do
  attendance = Attendance.new
  attendance.event = Event.all.sample
  attendance.attendee = User.all.sample
  attendance.save
end
puts "succes"
