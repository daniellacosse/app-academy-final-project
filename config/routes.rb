DArt::Application.routes.draw do
  root to: "deviations#index"

  resources :deviations

  shallow do
    resources :users do
      resources :journals
      resources :galleries
      resources :messages
    end
  end

  resources :users do
    resources :notifications, only: :index
  end

  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
