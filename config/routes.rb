Rails.application.routes.draw do
  get 'memes/index'
  devise_for :users
  resources :users, only: :show
  resources :categories, only: :index
  root to: 'memes#index'
  get '/popular', to: 'memes#by_popularity'
end
# rails g devise:views