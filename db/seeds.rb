# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

actors = [
  {
    first_name: "Jeff",
    last_name: "Bridges",
    known_for: "The Big Lebowski"
  },
  {
    first_name: "Viola",
    last_name: "Davis",
    known_for: "Fences"
  },
  {
    first_name: "Kate",
    last_name: "Winslet",
    known_for: "Eternal Sunshine of the Spotless Mind"
  }
]

actors.each do |actor|
  Actor.create!(actor)
end

puts "Seeded #{Actor.count} actors 🎉"