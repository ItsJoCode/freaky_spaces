# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Creating some users...'

def add_places(userid)
  3.times do
    cap = (3..9).to_a
    price = (20..600).to_a
    place = Place.new(
      name: Faker::Book.title,
      description: Faker::Lorem.paragraph,
      address: Faker::Address.full_address,
      capacity: cap.sample,
      price_per_day: price.sample,
      user_id: userid
    )
    place.save!
  end
end

PASSWD = "azerty"
user = User.new(
  first_name: "Jonathan",
  last_name: "Bergerot",
  email: "jobergerot@gmail.com",
  password: PASSWD
)
user.save!
add_places(user.id)

user = User.new(
  first_name: "Anthony",
  last_name: "Gombert",
  email: "anthonygombert33@gmail.com",
  password: PASSWD
)
user.save!
add_places(user.id)

user = User.new(
  first_name: "Ronan",
  last_name: "Laporte-Guiziou",
  email: "ronan.laporte@gmail.com",
  password: PASSWD
)
user.save!
add_places(user.id)

user = User.new(
                first_name: "Florent",
                last_name: "Arène",
                email: "florent.arene@gmail.com",
                password: PASSWD
              )
user.save!
add_places(user.id)

puts 'Users finished!'
