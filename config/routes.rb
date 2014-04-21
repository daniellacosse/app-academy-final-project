DArt::Application.routes.draw do
  resources :users
  resources :deviations
  resource :session, only: [:new, :create, :destroy]

  root to: "deviations#index"
end
