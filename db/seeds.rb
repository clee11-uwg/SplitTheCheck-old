# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.delete_all

Restaurant.create!(
  restaurant_id: 1,
  name: 'Burger Joint',
  address: '123 Main Road',
  city: 'Macon',
  state: 'GA',
  zip: '32154',
  upVoteCount: 40,
  downVoteCount: 25,
)
Restaurant.create!(
  restaurant_id: 2,
  name: 'The Bar',
  address: '245 Main Road',
  city: 'Macon',
  state: 'GA',
  zip: '32154',
  upVoteCount: 35,
  downVoteCount: 30
)
Restaurant.create!(
  restaurant_id: 3,
  name: 'The Rooftop',
  address: '987 Second Street',
  city: 'Macon',
  state: 'GA',
  zip: '32154',
  upVoteCount: 30,
  downVoteCount: 35
)
Restaurant.create!(
  restaurant_id: 4,
  name: 'The Sushi Place',
  address: '654 Third Street',
  city: 'Macon',
  state: 'GA',
  zip: '32154',
  upVoteCount: 25,
  downVoteCount: 40
)
User.create!(
  user_id: 1,
  email: 'test@test.com',
  password: 'test1234',
)
# Vote.create!(
#   user_id: 1,
#   restaurant_id: 1,
#   upVoteUserCount: 5,
#   downVoteUserCount: 2
# )
