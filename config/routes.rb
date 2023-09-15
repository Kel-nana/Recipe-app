# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'

  resources :users do
    resources :recipes do
      resources :recipe_foods
    end
    resources :public_recipes, only: %i[index show]
    resources :foods do
    end
  end
end
