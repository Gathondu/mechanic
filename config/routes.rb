Rails.application.routes.draw do
  # registration
  get 'customer/new', to: 'registrations#new', type: 'Customer', as: 'new_customer'
  post 'customer', to: 'registrations#create', type: 'Customer', as: 'create_customer'
  get 'admin/new', to: 'registrations#new', type: 'Admin', as: 'new_admin'
  post 'admin', to: 'registrations#create', type: 'Admin', as: 'create_admin'

  # sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resource :password_reset
  resource :password, only: %i[edit update]

  # users
  get 'employees', to: 'users#employees'
  resources :users, only: %i[index edit show update destroy]

  # cars and services
  resources :cars do
    resources :services, shallow: true
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'
end
