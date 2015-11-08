Rails.application.routes.draw do
  devise_for :publishers

  root to: 'home#index'

  resources :campaigns, only: [:index, :new, :create]
end
