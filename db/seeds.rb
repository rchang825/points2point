# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

sapphire_preferred = Card.create!(name: "Chase Sapphire Preferred", points: 10000,
conversion_rate: 1.25)
venture = Card.create!(name: "Capital One Venture", points: 30000, conversion_rate: 1)
alaska = Card.create!(name: "Alaska Airlines", points: 80000, conversion_rate: 1)
virgin = LoyaltyProgram.create!(name: "Virgin Atlantic", category: "airline")
flying_blue = LoyaltyProgram.create!(name: "Flying Blue", category: "airline")
hyatt = LoyaltyProgram.create!(name: "Hyatt", category: "hotel")
