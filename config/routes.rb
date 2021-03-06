Rails.application.routes.draw do
   
  devise_for :users



  post "home/comments/:post_id", to: "home#comments", as: :comments


  namespace :api, constraints: {format: "json"} do 
    get "posts", to: "posts#index"
    get "posts/:id", to: "posts#show"
    post "posts", to: "posts#create"   
    delete "posts/:id", to:"posts#destroy" 

    resources :sessions, only: :create do 
      collection do 
        post "login"
      end
    end
  end

  scope :admin do  
    resources :posts
    resources :categories
    resources :tags
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #controllername/actionname
  
  #root to: "home#index"   # OR
  root "home#index"
  scope :public do 
    get "home/search", to: "home#search", :as => :post_search
    get "home/read/:id", to: "home#read", :as => :post_read
    get "home/:tag/posts", to: "home#tag_search", :as => :tag_search
    get "home/category/:category_slug", to: "home#category_search", :as=> :category_search
    get 'home/ok'
    get 'home/index'
    get 'home/about', as: :about   #about_path or about_url
    get 'home/contact', as: :contact
  end
end
