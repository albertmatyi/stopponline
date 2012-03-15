Stopponline::Application.routes.draw do

  resources :routes
  
  root to: 'static_pages#home'
  devise_for :users
  resources :users, only: :show
  
  get 'static_pages/contact'
  match 'contact', to: 'static_pages#contact'

end
