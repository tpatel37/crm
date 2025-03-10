Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root route (ActiveAdmin Dashboard)
  root to: "admin/dashboard#index"

  # Customer routes with additional custom actions
  resources :customers, only: [:index, :show] do
    collection do
      get 'missing_email'  # Route for customers with missing emails
      get 'alphabetized'   # Route for customers sorted alphabetically
    end
  end
end