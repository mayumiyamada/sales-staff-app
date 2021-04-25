Rails.application.routes.draw do  
  devise_for :users
  root to: 'homes#index'
  resources :users, only: [:edit, :update, :show]
  resources :tweets
  resources :rooms, only: [:index, :new, :create, :destroy] do
  resources :messages, only: [:index, :create]
  end
end