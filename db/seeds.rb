# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cuisine.new(name: "Terroir local").save
Cuisine.new(name: "Française").save
Cuisine.new(name: "Italienne").save
Cuisine.new(name: "Burger").save
Cuisine.new(name: "Sushis").save
Cuisine.new(name: "Pizza").save
Cuisine.new(name: "Asiatique").save
Cuisine.new(name: "Espagnole").save
Cuisine.new(name: "Indien").save
Cuisine.new(name: "Cuisine du monde").save
Cuisine.new(name: "Fusion").save
Cuisine.new(name: "Orientale").save
Cuisine.new(name: "Végétarienne").save

Mood.new(name: "Entre amis").save
Mood.new(name: "Business").save
Mood.new(name: "Romantique").save
