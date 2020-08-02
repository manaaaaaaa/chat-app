Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
<<<<<<< Updated upstream
  resources :users, only: [:edit, :update]
=======
  resources :users
>>>>>>> Stashed changes
  resources :rooms, only: [:new, :create]
end
