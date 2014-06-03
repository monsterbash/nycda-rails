Rails.application.routes.draw do
  
  resources :sessions
  resources :users

  get "/signin" => "sessions#new"
  get "signout" => "sessions#destroy"

  get "/search" => "home#search"
  get "/posts"  => "home#show", as: :posts
  get "/" => "home#index", as: :home_page

end
