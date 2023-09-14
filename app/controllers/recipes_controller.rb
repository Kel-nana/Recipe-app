# frozen_string_literal: true

class RecipesController < ApplicationController
    def public_recipies
      @public = Recipe.where(pulic: true).order('created_as DESC')
    end
  end
  