Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  resources :categories, only: :index
  root to: 'home#index'
end
# rails g devise:views