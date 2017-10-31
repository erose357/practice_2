Rails.application.routes.draw do
  root 'destinations#index'
  namespace :api do
    namespace :v1 do
      resources :destinations, only: [:index, :show, :create]
    end
  end
  resources :destinations
end
