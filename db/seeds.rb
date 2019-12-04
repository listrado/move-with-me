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

third_location = Location.create!(
  address: 'Shenzhen, Guangdong, China',
  latitude: 22.542883,
  longitude: 114.062996
)

fourth_location = Location.create!(
  address: 'Copacabana, Rio de Janeiro, Brazil',
  latitude: -22.970722,
  longitude: -43.182365
)


fifth_location = Location.create!(
  address: 'Itaboraí, Rio de Janeiro, Brazil',
  latitude: -22.752754,
  longitude: -42.864876
)

sixth_location = Location.create!(
  address: 'Maracanã Stadium, Rio de Janeiro, Brazil',
  latitude: -22.912376,
  longitude: -43.230320
)

seventh_location = Location.create!(
  address: 'Ladera Da Gloria, 26- Gloria, Rio De Janeiro - RJ ',
  latitude: -22.919146,
  longitude: -43.171336
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

admin = User.create!(
  email: 'admin@gmail.com',
  password: 'lucas1'
  )

fourth_user = User.create!(
  email: 'user4@gmail.com',
  password: '123456'
  )


fifth_user = User.create!(
  email: 'user5@gmail.com',
  password: '123456'
  )

sixth_user = User.create!(
  email: 'user6@gmail.com',
  password: '123456'
  )

seventh_user = User.create!(
  email: 'user7@gmail.com',
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

third_group = Group.create!(
  start_at: Time.now,
  start_location: fourth_location,
  end_location: fifth_location
)

fourth_group = Group.create!(
  start_at: Time.now,
  start_location: fourth_location,
  end_location: fifth_location
)

fifth_group = Group.create!(
  start_at: Time.now,
  start_location: fourth_location,
  end_location: fifth_location
)


sixth_group = Group.create!(
  start_at: Time.now,
  start_location: third_location,
  end_location: seventh_location
)

seventh_group = Group.create!(
  start_at: Time.now,
  start_location: sixth_location,
  end_location: fifth_location
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

third_journey = Journey.create!(
  group: populated_group,
  user: admin
)

fourth_journey = Journey.create!(
  group: populated_group,
  user: fourth_user
)

fifth_journey = Journey.create!(
  group: fifth_group,
  user: fifth_user
)

sixth_journey = Journey.create!(
  group: fifth_group,
  user: sixth_user
)

seventh_journey = Journey.create!(
  group: fifth_group,
  user: seventh_user
)


# Journeys: Noboby joins group 2


puts "seed completed"

