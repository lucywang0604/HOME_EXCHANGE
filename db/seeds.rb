# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

lucy = User.create(email: 'lucy@example.com', password: 'password')
john = User.create(email: 'john@example.com', password: 'password')

Flat.create(name: 'Little flat in Paris', description: 'Some description', price: 120, user: lucy)
Flat.create(name: 'Giant flat in London', description: 'Some description', price: 250, user: lucy)
Flat.create(name: 'Cozy flat in Budapest', description: 'Some description', price: 50, user: john)
