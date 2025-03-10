Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :customers do
        resources :subscriptions, only: [:index, :create, :destroy]
        resources :teas, only: [:index, :create, :destroy]
      end

      resources :subscriptions, only: [:index, :show]
      resources :teas, only: [:index, :show]
    end
  end
end
