# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cities') #commande pour reset l'id

User.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users') #commande pour reset l'id

Gossip.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('gossips') #commande pour reset l'id

c_array = []
15.times do
	c = City.create(name: Faker::TvShows::Simpsons.location)
	c_array << c
end
puts "'City' created"

20.times do
	u = User.create(name: Faker::Name.last_name, first_name: Faker::Name.first_name, age: Faker::Number.between(from: 10, to: 99), city_id: rand(1..15))
	u.email = u.first_name + '_' + u.name + '@mail.com'
	u.save
end
puts "Users created"

anonymus = User.create(name: "Anonymouss", email: "anon@mus", first_name: "John Doe", age: "50", city_id: 2)
puts "'Anonymouss' created"

15.times do
	g = Gossip.create(gossip: Faker::ChuckNorris.fact, user_id: rand(1..20), title: Faker::Games::Heroes.specialty)
end
puts "Gossips created"

30.times do
	g = Comment.create(content: Faker::TvShows::Stargate.quote, user_id: rand(1..20), gossip_id: rand(1..15))
end
puts "Comments created"
