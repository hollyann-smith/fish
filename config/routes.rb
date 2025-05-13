Rails.application.routes.draw do
  get "users/show"
  devise_for :users
  resources :catches
  # get "home/index"
  get "home/about"
  root "home#index"
  get "/profile", to: "users#show", as: "profile"

  resources :catches do
    resources :comments, only: [ :create ]
    resources :reactions, only: [ :create ]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [ :show ]
end
