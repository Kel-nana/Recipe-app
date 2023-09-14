# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'

  resources :users do
    resources :recipes, only: %i[new create edit destroy]

    get '/public_recipies', to: 'recipies#public_recipies'
    root 'recipies#public_recipies'
  end
 
