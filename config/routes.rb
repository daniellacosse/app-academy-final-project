DArt::Application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]

  root to: "sessions#new"
end
