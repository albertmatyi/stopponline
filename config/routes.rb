Stopponline::Application.routes.draw do

  resources :routes
  resources :locations
  
  root to: 'static_pages#home'
  devise_for :users
  resources :users, only: :show
  
  get 'static_pages/contact'
  match 'contact', to: 'static_pages#contact', as: :contact
  
  get 'locations/by_prefix'
  match 'locations/by_prefix/:prefix', to: 'locations#by_prefix'

end
