DArt::Application.routes.draw do
  root to: "deviations#index"

  get "/search", controller: "pages", action: "search"

  resource :session, only: [:new, :create, :destroy]
  get 'auth/facebook/callback', to: 'sessions#fb_create'

  resources :deviations

  shallow do
    resources :users do
      resources :galleries
      resources :journals
      resources :messages, except: [:edit, :update]
      resources :notifications, only: [:index]
    end
  end

  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end