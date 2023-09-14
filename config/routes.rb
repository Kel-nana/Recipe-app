# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'

  resources :users do
    resources :recipes, only: %i[new create edit destroy]
    resources :foods, only: %i[index, :new, :create destroy]
    
  end
end

