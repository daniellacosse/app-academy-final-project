DArt::Application.routes.draw do
  root to: "deviations#index"

  resources :deviations

  shallow do
    resources :users do
      resources :journals
    end
  end

  resource :session, only: [:new, :create, :destroy]
end
