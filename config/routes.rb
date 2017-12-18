Rails.application.routes.draw do

  root "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :users, only: [:new, :create, :show]

  resources :categories, only: [:index, :show] do
    resources :gifs, only: [:index, :show]
  end

  namespace :admin do
    resources :categories, only: [:index, :new, :create, :destroy]
  end
end
