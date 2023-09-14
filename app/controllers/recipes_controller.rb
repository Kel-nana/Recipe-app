class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index public_recipes]

  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def public_recipes
    @public = Recipe.where(public: true).order('created_at DESC')
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
    else
      redirect_to recipes_path, alert: 'There was an error deleting the Recipe.'
    end
  end
end
