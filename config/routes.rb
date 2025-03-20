Rails.application.routes.draw do
  # Dedicated Map page
  get 'map', to: 'map#index'
  
  # Health status and PWA endpoints
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root path and About page
  root 'animals#index'
  get 'about', to: 'pages#about'

  # Resourceful routes for Animals, Habitats, and Observations
  resources :animals, only: [:index, :show]
  resources :habitats, only: [:index, :show]
  resources :observations, only: [:index, :show]
end
