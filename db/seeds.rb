# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

CarBattery.create!([
  { brand: "Exide", model: "X1-60", voltage: 12, price: 350, warranty: 24 },
  { brand: "Amaron", model: "Pro-50", voltage: 12, price: 320, warranty: 18 },
  { brand: "Bosch", model: "Silver-70", voltage: 12, price: 400, warranty: 36 },
  { brand: "Varta", model: "Blue-55", voltage: 12, price: 375, warranty: 30 },
  { brand: "Panasonic", model: "N70ZZ", voltage: 12, price: 450, warranty: 48 }
])


