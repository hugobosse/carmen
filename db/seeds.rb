# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cuisine.new(name: "Locale").save
Cuisine.new(name: "Français").save
Cuisine.new(name: "Italien").save
Cuisine.new(name: "Burger").save
Cuisine.new(name: "Sushis").save
Cuisine.new(name: "Pizza").save
Cuisine.new(name: "Asiatique").save
Cuisine.new(name: "Espagnol").save
Cuisine.new(name: "Indien").save
Cuisine.new(name: "Cuisine du monde").save
Cuisine.new(name: "Fusion").save
Cuisine.new(name: "Orientale").save
Cuisine.new(name: "Végétarien").save

Mood.new(name: "Entre amis").save
Mood.new(name: "Business").save
Mood.new(name: "Romantique").save
