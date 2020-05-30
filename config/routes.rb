Rails.application.routes.draw do
  get 'memes/index' #TODO: borrar?
  devise_for :users
  resources :users, only: :show
  resources :categories, only: :index
  root to: 'memes#index'
  get '/popular', to: 'memes#by_popularity'
  # resources :memes, only: [:index, :show, :new, :create, :edit, :update]
  resources :memes, only: [:new, :show, :create,:update] do
    resources :votes, only: [:create]
    resources :comments, only: [:create]
  end
end
# rails g devise:views