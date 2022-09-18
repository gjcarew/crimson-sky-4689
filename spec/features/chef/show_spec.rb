require 'rails_helper'

RSpec.describe 'Chef show page' do
  describe "When I visit a chef's show page" do
    before :each do
      @chef = Chef.create!(name: 'Francoise Bonin')
      @dish = @chef.dishes.create!(name: "Mac 'n Cheese", description: 'Dangerously cheesy')
      @macaroni = @dish.ingredients.create!(name: 'Macaroni', calories: 250)
      @milk = @dish.ingredients.create!(name: 'Condensed milk', calories: 120)
      @cheese = @dish.ingredients.create!(name: 'Cheddar cheese', calories: 220)
      @sad_chef = Chef.create!(name: 'Ratatouille')
      sad_dish = @sad_chef.dishes.create!(name: 'Salad', description: 'Sad path salad')
      @sad_ingredient = sad_dish.ingredients.create(name: 'Lettuce', calories: 7)
    end

    it 'I see the name of the chef' do
      visit chef_path(@chef)
      expect(page).to have_content(@chef.name)
      expect(page).not_to have_content(@sad_chef.name)
    end

    it 'I see a link to a list of all ingredients they use in their dishes' do
      visit chef_path(@chef)
      click_link "View #{@chef.name}'s ingredients"
      expect(current_path).to eq(chef_ingredients_path(@chef))
    end
  end
end
