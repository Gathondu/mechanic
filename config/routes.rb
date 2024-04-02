Rails.application.routes.draw do
  get 'customer/new', to: 'registrations#new', type: 'Customer', as: 'new_customer'
  post 'customer', to: 'registrations#create', type: 'Customer', as: 'create_customer'
  get 'admin/new', to: 'registrations#new', type: 'Admin', as: 'new_admin'
  post 'admin', to: 'registrations#create', type: 'Admin', as: 'create_admin'

  get 'customer/login', to: 'sessions#new', type: 'Customer'
  post 'customer/login', to: 'sessions#create', type: 'Customer'
  get 'admin/login', to: 'sessions#new', type: 'Admin'
  post 'admin/login', to: 'sessions#create', type: 'Admin'
  delete 'logout', to: 'sessions#destroy'

  resource :password_reset
  resource :password

  scope 'users' do
    resources :customers, controller: 'users', type: 'Customer', only: %i[index show edit update destroy]
    resources :admins, controller: 'users', type: 'Admin', only: %i[index show edit update destroy] do
      resources :employees, shallow: true
    end
  end
  resources :customers, controller: 'users', type: 'Customer', only: %i[index show edit update destroy] do
    resources :cars, shallow: true
  end
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
