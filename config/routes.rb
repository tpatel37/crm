Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Define the root path route ("/")
  root 'customers#index'  # Set the root route to show the customers' index page

  # Customer routes
  get '/customers/alphabetized', to: 'customers#alphabetized'  # Custom route for alphabetized customers
  get '/customers/missing_email', to: 'customers#missing_email'  # Custom route for customers with missing emails
  resources :customers, only: [:index]  # Resourceful route for customers, limiting to index action only
end
