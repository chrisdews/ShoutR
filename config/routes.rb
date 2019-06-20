Rails.application.routes.draw do

  resources :hates
  root to: 'sessions#new'

  get 'sessions/new'
  get 'login', to: 'sessions#new', as: :login
  post 'sessions', to: 'sessions#create', as: :sessions
  get 'sessions/destroy', as: :logout
  get 'signup', to: 'users#new', as: :signup

  resources :likes
  resources :hates

  resources :shouts  do
      patch "like", on: :member
      patch "unlike", on: :member
      patch "likeindex", on: :member
      patch "unlikeindex", on: :member

      patch "comment", on: :member

      patch "hate", on: :member
      patch "unhate", on: :member
      patch "hateindex", on: :member
      patch "unhateindex", on: :member
  end

  resources :comments  do
    patch "like", on: :member
    patch "unlike", on: :member
    patch "hate", on: :member
    patch "unhate", on: :member
  end
  
  resources :users
end
