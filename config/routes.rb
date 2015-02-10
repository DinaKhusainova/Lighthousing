Rails.application.routes.draw do

  devise_for :admins

  resources :model_orders,      only: [:index, :create]
  resources :photoshoot_orders, only: [:index, :create]

  get '/finish', to: 'main#finish'

  namespace :admin do
    resources :orders,            only: [:index]
    resources :photoshoot_orders, only: [:show, :destroy]
    resources :model_orders,      only: [:show, :destroy]

    root to: 'orders#index'
  end

  root 'main#index'
end
