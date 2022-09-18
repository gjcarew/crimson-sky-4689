require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe '#instance methods' do
    it 'prints the chefs name' do
      chef = Chef.create!(name: 'Francoise Bonin')
      dish = chef.dishes.create!(name: "Mac 'n Cheese", description: 'Dangerously cheesy')
      expect(dish.chef_name).to eq(chef.name)
    end

    it 'can tell total calories of a dish' do
      @chef = Chef.create!(name: 'Francoise Bonin')
      @dish = @chef.dishes.create!(name: "Mac 'n Cheese", description: 'Dangerously cheesy')
      @macaroni = @dish.ingredients.create!(name: 'Macaroni', calories: 250)
      @milk = @dish.ingredients.create!(name: 'Condensed milk', calories: 120)
      @cheese = @dish.ingredients.create!(name: 'Cheddar cheese', calories: 220)
      @sad_chef = Chef.create!(name: 'Ratatouille')
      sad_dish = @sad_chef.dishes.create!(name: 'Salad', description: 'Sad path salad')
      @sad_ingredient = sad_dish.ingredients.create(name: 'Lettuce', calories: 7)

      expect(@dish.calories).to eq(590)
    end
  end
end