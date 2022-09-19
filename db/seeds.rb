# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef = Chef.create!(name: 'Francoise Bonin')
@dish = @chef.dishes.create!(name: "Mac 'n Cheese", description: 'Dangerously cheesy')
@macaroni = @dish.ingredients.create!(name: 'Macaroni', calories: 250)
@milk = @dish.ingredients.create!(name: 'Condensed milk', calories: 120)
@cheese = @dish.ingredients.create!(name: 'Cheddar cheese', calories: 220)
@sad_chef = Chef.create!(name: 'Ratatouille')
sad_dish = @sad_chef.dishes.create!(name: 'Salad', description: 'Sad path salad')
@sad_ingredient = sad_dish.ingredients.create(name: 'Lettuce', calories: 7)