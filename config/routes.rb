Rails.application.routes.draw do
  root to: 'vehicles#index'
  resources :vehicles do
    resources :washes, only: :new
  end
  resources :washes, only: [:index, :create, :show]
end
