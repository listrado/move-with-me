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
  address: 'Ladera Da Gloria, 26- Gloria, Rio De Janeiro - RJ ',
  latitude: -43.198612,
  longitude: -22.983603
)

second_location = Location.create!(
  address: 'Ipanema, Rio de Janeiro, Brazil',
  latitude: -22.951460,
  longitude: -43.184490
)

third_location = Location.create!(
  address: 'Antero de Quental, Rio de Janeiro, Brazil',
  latitude: -22.984440,
  longitude: -43.223699
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
  address: 'Botafogo, Rio De Janeiro, Brazil',
  latitude: -22.919146,
  longitude: -43.171336
)


puts "creating users"



first_user = User.create!(
  email: 'artur@gmail.com',
  password: '123456'
  )


second_user = User.create!(
  email: 'harrie@gmail.com',
  password: '123456'
  )

admin = User.create!(
  email: 'listrado@gmail.com',
  password: '123456'
  )

fourth_user = User.create!(
  email: 'caio@gmail.com',
  password: '123456'
  )


fifth_user = User.create!(
  email: 'andre@gmail.com',
  password: '123456'
  )

sixth_user = User.create!(
  email: 'milene@gmail.com',
  password: '123456'
  )

seventh_user = User.create!(
  email: 'marcel@gmail.com',
  password: '123456'
  )

eighth_user = User.create!(
  email: 'pedro@gmail.com',
  password: '123456'
  )






puts "creating groups"

year = Time.current.year
month = Time.current.month
day = Time.current.day

# Group going from 1 to 2
populated_group = Group.create!(
  start_at: Time.new(year,month,day,0,0),
  start_location: first_location,
  end_location: second_location
)

# Group going from 2 to 1
empty_group = Group.create!(
  start_at: Time.new(year,month,day,1,0),
  start_location: second_location,
  end_location: first_location
)

third_group = Group.create!(
  start_at: Time.new(year,month,day,2,0),
  start_location: fourth_location,
  end_location: fifth_location
)

fourth_group = Group.create!(
  start_at: Time.new(year,month,day,3,0),
  start_location: fourth_location,
  end_location: fifth_location
)

fifth_group = Group.create!(
  start_at: Time.new(year,month,day,4,0),
  start_location: fourth_location,
  end_location: fifth_location
)


sixth_group = Group.create!(
  start_at: Time.new(year,month,day,5,0),
  start_location: third_location,
  end_location: seventh_location
)

seventh_group = Group.create!(
  start_at: Time.new(year,month,day,6,0),
  start_location: sixth_location,
  end_location: fifth_location
)


eighth_group = Group.create!(
  start_at: Time.new(year,month,day,7,0),
  start_location: sixth_location,
  end_location: fifth_location
)

ninth_group = Group.create!(
  start_at: Time.new(year,month,day,20,0),
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

