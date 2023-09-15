# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def show; end

  def logout
    sign_out current_user
    redirect_to root_path
  end
end
