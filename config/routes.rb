Rails.application.routes.draw do
  resources :tasks
  root to: "tasks#index"
  get "/top", to: "tasks#top"
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
  end
  resources :users
  get "/error", to: "tasks#error"
  # resources :contents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
