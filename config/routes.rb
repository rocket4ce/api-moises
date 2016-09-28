Rails.application.routes.draw do
  devise_for :users
  resources :posts
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :users, only: [:create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
