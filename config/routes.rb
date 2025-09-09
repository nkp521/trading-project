Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :strategies, only: [ :index, :show ]
  resources :users, only: [ :index, :show ]
end
