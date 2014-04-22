DArt::Application.routes.draw do
  root to: "deviations#index"

  resources :deviations

  resources :users do
    resources :journals
  end

  resource :session, only: [:new, :create, :destroy]
end
