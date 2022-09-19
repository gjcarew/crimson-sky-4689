class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.joins(:dishes)
                             .where(['chef_id = ?', params[:chef_id]])
                             .distinct
    @chef = Chef.find(params[:chef_id])
  end
end
