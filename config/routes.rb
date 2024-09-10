Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only: [:index ,:create]
    resources :orders, only: [:index, :create]
  end
end
