Rails.application.routes.draw do

  root to: 'users#new'

  get 'sessions/new'
  get 'login', to: 'sessions#new', as: :login
  post 'sessions', to: 'sessions#create', as: :sessions
  get 'sessions/destroy', as: :logout
  get 'signup', to: 'users#new', as: :signup


  resources :comments  do
      patch "like", on: :member
  end
  resources :likes
  resources :shouts
  resources :users
end
