Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

    resources :users

  resources :comments do 
    collection do 
      get :other_comments
    end
  end

  resources :blogs

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end