Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  root to: "home#index"
  resources :groups, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :new, :create]
  end
end
