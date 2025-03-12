Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # MVP Routes
      resources :subscriptions, only: [:index, :show, :destroy]
      resources :teas, only: [:index]
      resources :customers, only: [:index,:show, :create] 
      resources :customer_subscriptions, only: [:create, :destroy]

    end
  end
end