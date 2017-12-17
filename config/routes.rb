Rails.application.routes.draw do
  resources :categories, only: [:index, :show] do
    resources :gifs, only: [:index, :show]
  end

  namespace :admin do
    resources :categories, only: [:new, :create, :destroy]
  end
end
