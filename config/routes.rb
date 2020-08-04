Rails.application.routes.draw do
  devise_for :users
  root "rooms#index"
  resources :users
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
