Stopponline::Application.routes.draw do

  devise_for :users
  #resources users [:

#  get "static_pages/home"

  root to: 'static_pages#home'
  
end
