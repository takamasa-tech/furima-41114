Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items, only: [:create, :new] do
    resources :purchases, only: [:index ,:create]
  end
end
