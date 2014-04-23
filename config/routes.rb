DArt::Application.routes.draw do
  root to: "deviations#index"

  resources :deviations

  shallow do
    resources :users do
      resources :journals
      resources :galleries
    end
  end

  resources :users do
    resources :messages
  end

  resource :session, only: [:new, :create, :destroy]
end
