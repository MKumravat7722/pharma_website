Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pages, only: [:index], param: :slug
      get "pages/:slug", to: "pages#show"
      resources :contact_submissions, only: [:create]
    end

  end
end
