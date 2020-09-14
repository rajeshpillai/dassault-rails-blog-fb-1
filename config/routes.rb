Rails.application.routes.draw do
   
  get "home/read/:id", to: "home#read", :as => :post_read

  resources :posts
  resources :categories
  resources :tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #controllername/actionname
  
  #root to: "home#index"   # OR
  root "home#index"

  get 'home/ok'
  get 'home/index'
  get 'home/about', as: :about   #about_path or about_url
  get 'home/contact', as: :contact
end
