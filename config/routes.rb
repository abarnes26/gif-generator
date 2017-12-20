Rails.application.routes.draw do

  root "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create, :show] do
    resources :gifs, only: [:index, :show] do
      resources :favorites, only: [:new, :create]
    end
  end

  resources :users do
    resources :favorites, only: [:index, :show, :destroy]
  end

  resources :categories do
    resources :gifs, only: [:index, :show] do
    end
  end

  resources :gifs, only: [:index, :show]

  namespace :admin do
    resources :categories, only: [:index, :new, :create, :destroy, :show]
    resources :gifs, only: [:index, :new, :create]
  end
end

# index, show, new, create, edit, update, destroy
