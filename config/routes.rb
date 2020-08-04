Rails.application.routes.draw do
  devise_for :users
  root "rooms#index"
  resources :users
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
  end
end
