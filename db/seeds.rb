# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
require 'open-uri'
require 'json'

puts "Seeding ingredients"

json = open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
my_hash = JSON.parse(json)

my_hash["drinks"].each do |pair|
  ingredient = pair.values[0]
  Ingredient.create(name: ingredient)
end
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

puts "Finished"
