# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Se destruyeron todos los restaurantes' if Restaurant.destroy_all

restaurant_1 = Restaurant.new(name: 'El japones', address: 'Calle Samurai 3467', phone_number: '98657328', category: 'japanese')
puts 'Se creo el primer restaurante' if restaurant_1.save

restaurant_2 = Restaurant.new(name: 'El chino', address: 'Calle Huawei 189', phone_number: '88654326', category: 'chinese')
puts 'Se creo el segundo restaurante' if restaurant_2.save

restaurant_3 = Restaurant.new(name: 'El frances', address: 'Calle Charles de Gaulle 432', phone_number: '98657328', category: 'french')
puts 'Se creo el tercer restaurante' if restaurant_3.save

restaurant_4 = Restaurant.new(name: 'El belga', address: 'Calle chocolate 2134', phone_number: '78457328', category: 'belgian')
puts 'Se creo el cuarto restaurante' if restaurant_4.save

restaurant_5 = Restaurant.new(name: 'El italiano', address: 'Calle pizza 457', phone_number: '98653328', category: 'italian')
puts 'Se creo el quinto restaurante' if restaurant_5.save


#chinese italian japanese french belgian
