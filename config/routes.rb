Rails.application.routes.draw do
  resources :supports
  devise_for :publishers

  root to: 'home#index'

  resources :campaigns, only: [:index, :new, :create] do
    resources :supports, only: [:create]
  end
end
