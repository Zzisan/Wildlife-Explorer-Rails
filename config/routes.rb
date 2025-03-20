Rails.application.routes.draw do
  get "map/index"
  get "maps/index"
  get "observations/index"
  get "observations/show"
  get "habitats/index"
  get "habitats/show"
  get "animals/index"
  get "animals/show"
  get "pages/about"
  get 'map', to: 'map#index'

  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root 'animals#index'
  get 'about', to: 'pages#about'

  resources :animals
  resources :habitats
  resources :observations
end
