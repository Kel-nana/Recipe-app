# The `FoodsController` handles CRUD operations for recipes.
# It allows users to create, view, edit, and delete recipes.
class FoodsController < ApplicationController
  before_action :authenticate_user! # This ensures the user is logged in
  load_and_authorize_resource

  def index
    @foods = Food.where(user_id: current_user.id).includes(:user) # n+1problem fixed
  end

  def new
    @user = User.find(params[:user_id])
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      redirect_to user_foods_path, notice: 'Food created successfully.'
    else
      flash.now[:alert] = @food.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])

    if @food.destroy
      redirect_to user_foods_path, notice: 'Food successfully deleted.'
    else
      redirect_to user_foods_path, alert: 'Failed to delete food.'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
