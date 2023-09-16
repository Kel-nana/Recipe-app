# The `GeneralShoppingListsController` handles CRUD operations for recipes.
# It allows users to create, view, edit, and delete recipes.
class GeneralShoppingListsController < ApplicationController
  before_action :authenticate_user! # This ensures the user is logged in
  def index
    @foods = Food.all
    @total = 0
    current_user.foods.each do |food|
      @total += food.price * food.quantity
    end
  end
end
