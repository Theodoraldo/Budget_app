Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"

  resources :groups, only: [:index, :new, :create]

  resources :entities, only: [:index, :show, :new, :create]
end
