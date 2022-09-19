require 'rails_helper'

RSpec.describe 'ingredients index' do
  it 'lists all ingredients used by a chef' do
    @chef = Chef.create!(name: 'Francoise Bonin')
    @dish = @chef.dishes.create!(name: "Mac 'n Cheese", description: 'Dangerously cheesy')
    @macaroni = @dish.ingredients.create!(name: 'Macaroni', calories: 250)
    @milk = @dish.ingredients.create!(name: 'Condensed milk', calories: 120)
    @cheese = @dish.ingredients.create!(name: 'Cheddar cheese', calories: 220)
    @sad_chef = Chef.create!(name: 'Ratatouille')
    sad_dish = @sad_chef.dishes.create!(name: 'Salad', description: 'Sad path salad')
    @sad_ingredient = sad_dish.ingredients.create(name: 'Lettuce', calories: 7)
    visit chef_ingredients_path(@chef)
    expect(page).to have_content(@milk.name)
    expect(page).to have_content(@cheese.name)
    expect(page).to have_content(@macaroni.name)
    expect(page).to_not have_content(@sad_ingredient.name)
  end
end
