Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #controllername/actionname
  
  #root to: "home#index"   # OR
  root "home#index"

  get 'home/ok'
  get 'home/index'
  get 'home/about'
  get 'home/contact'
end
