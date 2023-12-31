# The `UserController` handles CRUD operations for recipes.
class UsersController < ApplicationController
  def index; end

  def show; end

  def logout
    sign_out current_user
    redirect_to root_path
  end
end
