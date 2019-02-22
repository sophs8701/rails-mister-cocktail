# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

ingredients['drinks'].each do |ingredient|
  ingredientname = ingredient['strIngredient1']
  Ingredient.create(name: ingredientname)
  puts ingredientname
end

# name = {
#   first: sophie
#   last: spratley
# }

# name[first]

30.times { Cocktail.create(name: Faker::Dessert.flavor) }


# Cocktail.create(name: "manhatten")
# Cocktail.create(name: "whisky sour")
# Cocktail.create(name: "cherry sour")
# Cocktail.create(name: "negroni")
