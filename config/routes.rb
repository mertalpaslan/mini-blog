Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/' => 'blogs#blog', :constraints => { :subdomain => /.+/ }
  
  defaults subdomain: '' do
    root to: "posts#index"
    resources :posts
    resources :comments 
  end

  constraints subdomain: /.*/ do
    resources :blogs
  end
end
