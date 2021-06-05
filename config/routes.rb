Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :comments
  resources :posts
end
