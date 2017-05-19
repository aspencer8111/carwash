Rails.application.routes.draw do
  root to: 'vehicles#index'
  resources :vehicles do
    resources :washes, only: [:index, :new]
  end
  resources :washes, only: :create
end
