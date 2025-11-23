# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Actor.delete_all!
Movie.delete_all!

actors = [
  {
    first_name: "Denzel",
    last_name: "Washington",
    known_for: "Fences"
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

movies = [
  {
    title: "Fences",
    year: 2016,
    plot: "Fences and Love"
  },
  {
    title: "Eternal Sunshine of the Spotless Mind",
    year: 2004,
    plot: "Memory and Love"
  }
]

movies.each do |movie|
  Movie.create!(movie)
end

puts "Seeded #{Actor.count} actors 🎉"
puts "Seeded #{Movie.count} movies 🎉"