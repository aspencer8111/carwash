Rails.application.routes.draw do
  root to: 'vehicles#index'
  resources :vehicles do
    resources :charges, only: [:index, :new]
  end
  resources :charges, only: :create
end
