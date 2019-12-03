# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Group.destroy_all
Journey.destroy_all
Location.destroy_all



puts "creating locations"
first_location = Location.create!(
  address: '16 Villa Gaudelet, Paris',
  latitude: 48.8648482,
  longitude: 2.3798534
)

second_location = Location.create!(
  address: 'The Hôtel de Ville, Paris, France',
  latitude: 48.856373,
  longitude: 2.353016
)


puts "creating users"

first_user = User.create!(
  email: 'user1@gmail.com',
  password: '123456'
  )


second_user = User.create!(
  email: 'user2@gmail.com',
  password: '123456'
  )


puts "creating groups"
# Group going from 1 to 2
populated_group = Group.create!(
  start_at: Time.now,
  start_location: first_location,
  end_location: second_location
)

# Group going from 2 to 1
empty_group = Group.create!(
  start_at: Time.now,
  start_location: second_location,
  end_location: first_location
)


puts "creating journeys"
# Journeys: Users 1 and 2 join Group 1
first_journey = Journey.create!(
  group: populated_group,
  user: first_user
)
second_journey = Journey.create!(
  group: populated_group,
  user: second_user
)

# Journeys: Noboby joins group 2


puts "seed completed"

