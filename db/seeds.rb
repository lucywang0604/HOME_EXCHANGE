# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'

User.destroy_all
Flat.destroy_all

lucy = User.create(email: 'lucy@example.com', password: 'password')
john = User.create(email: 'john@example.com', password: 'password')

lucy.avatar.attach(io: URI.parse('https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D').open, filename: 'avatar.jpg', content_type: 'image/jpg')
john.avatar.attach(io: URI.parse('https://images.unsplash.com/photo-1541752171745-4176eee47556?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D').open, filename: 'avatar.jpg', content_type: 'image/jpg')

flat_1 = Flat.create(name: 'Little flat in Paris', description: 'Some description', price: 120, user: lucy)
flat_1.image.attach(io: URI.parse('https://images.unsplash.com/photo-1507089947368-19c1da9775ae?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D').open, filename: 'flat.jpg', content_type: 'image/jpg')
flat_2 = Flat.create(name: 'Giant flat in London', description: 'Some description', price: 250, user: lucy)
flat_2.image.attach(io: URI.parse('https://images.unsplash.com/photo-1503174971373-b1f69850bded?q=80&w=3013&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D').open, filename: 'flat.jpg', content_type: 'image/jpg')
flat_3 = Flat.create(name: 'Cozy flat in Budapest', description: 'Some description', price: 50, user: john)
flat_3.image.attach(io: URI.parse('https://images.unsplash.com/photo-1516455590571-18256e5bb9ff?q=80&w=2784&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D').open, filename: 'flat.jpg', content_type: 'image/jpg')
