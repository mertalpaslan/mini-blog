Rails.application.routes.draw do
  devise_for :users
  get '/' => 'blogs#blog', :constraints => { :subdomain => /.+/ }
  
  defaults subdomain: '' do
    root to: "posts#index"
    resources :posts
    resources :comments do 
      collection do 
        get :other_comments
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints subdomain: /.*/ do
    resources :blogs
  end
end
