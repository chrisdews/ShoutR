Rails.application.routes.draw do
  resources :comments
  resources :likes
  resources :shouts
  resources :users
end
