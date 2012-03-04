Stopponline::Application.routes.draw do

  resources :routes

  root to: 'static_pages#home'
  devise_for :users
  resources :users, only: :show

end
