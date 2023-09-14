class FoodsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
  
    def index
      @foods = Food.all
    end
  
    def new
      @food = Food.new
    end
  
    def show
      @food = Food.find_by_id(params[:id])
    end
  
    def create
      @food = Food.create(food_params)
      @food.user_id = current_user.id
  
      if @food.save
        redirect_to foods_path
      else
        render :new, status: 422
      end
    end
  
    def destroy
      @food = Food.find(params[:id])
  
      if @food.destroy
        redirect_to foods_path, notice: 'Food successfully deleted.'
      else
        redirect_to foods_path, alert: 'There was an error deleting the Food.'
      end
    end
  
    private
  
    def food_params
      params.require(:food).permit(:id, :name, :measurement_unit, :price, :quantity)
    end
  end
  