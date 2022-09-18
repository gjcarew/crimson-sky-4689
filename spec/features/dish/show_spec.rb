require 'rails_helper'

RSpec.describe 'Dish show page' do
  describe 'User story 1: When I visit a dish show page' do
    before :each do
      @chef = Chef.create!(name: 'Francoise Bonin')
      @dish = chef.dishes.create!(name: "Mac 'n Cheese", description: 'Dangerously cheesy')
      @macaroni = dish.ingredients.create!(name: 'Macaroni', calories: 250)
      @milk = dish.ingredients.create!(name: 'Condensed milk', calories: 120)
      @cheese = dish.ingredients.create!(name: 'Cheddar cheese', calories: 220)
      @sad_chef = Chef.create!(name: 'Ratatouille')
      sad_dish = @sad_chef.dishes.create!(name: 'Salad', description: 'Sad path salad')
      @sad_ingredient = sad_dish.dishes.create(name: 'Lettuce', calories: 7)
    end

    it "I see the dish's name and description" do
      visit dish_path(@dish)
      
      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
    end

    it 'I see a list of ingredients for that dish' do
      visit dish_path(@dish)
      expect(page).to have_content(@macaroni.name)
      expect(page).to have_content(@milk.name)
      expect(page).to have_content(@cheese.name)
      expect(page).not_to have_content(@sad_ingredient.name)
    end

    it "I see the chef's name" do
      visit dish_path(@dish)
      expect(page).to have_content(@chef.name)
      expect(page).not_to have_content(@sad_chef.name)
    end

  end
end