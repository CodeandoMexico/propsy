Rails.application.routes.draw do
  resources :supports
  devise_for :publishers

  root to: 'home#index'

  resources :campaigns, only: [:index, :new, :create, :show] do
    resources :supports, only: [:create]
  end
end
