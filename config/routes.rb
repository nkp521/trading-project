Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :strategies, only: [ :index, :show, :new ]
  
  resources :users, only: [ :index, :show ] do
    resources :strategies, only: [ :new, :create ]
  end
end
