Rails.application.routes.draw do
  devise_for :admin_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  namespace :api do
    namespace :v1 do
      resources :pages, param: :slug, only: [:index, :show]

      resources :products, param: :slug, only: [:index, :show]

      resources :categories, only: [:index, :show]

      resources :faqs, only: [:index]
      resources :testimonials, only: [:index]

      resources :contact_submissions, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resource :cart, only: [:show] do
        post :add_item
      end
    end
  end
  
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end


