DArt::Application.routes.draw do
  root to: "deviations#index"

  get "/search", controller: "pages", action: "search"
  get "/guest", controller: "sessions", action: "guest"

  resource :session, only: [:new, :create, :destroy]
  get 'auth/facebook/callback', to: 'sessions#fb_create'

  resources :deviations
  get '/scroll', controller: 'deviations', action: 'scroll'

  shallow do
    resources :users do
      get '/verification', controller: 'pages', action: 'verify'
      resources :galleries
      resources :journals
      resources :messages, except: [:edit, :update]
      resources :notifications, only: [:index]
    end
  end

  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]

  namespace :api, defaults: {render: :json} do
    resources :deviations
    shallow do
      resources :users do
        get '/verification', controller: 'pages', action: 'verify'
        resources :galleries
        resources :journals
        resources :messages, except: [:edit, :update]
        resources :notifications, only: [:index]
      end
    end
  end
end
