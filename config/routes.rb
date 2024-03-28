Rails.application.routes.draw do
  scope 'users' do
    resources :customers, controller: 'users', type: 'Customer'
    resources :admins, controller: 'users', type: 'Admin' do
      resources :employees, shallow: true
    end
  end
  resources :customers, controller: 'users', type: 'Customer' do
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
