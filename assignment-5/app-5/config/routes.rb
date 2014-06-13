Rails.application.routes.draw do
    
  resources :sessions
  resources :users 
  resources :posts

  resources :users, only: [] do
    resources :posts, only: [:index]
  
  end

  get "/signin" => "sessions#new"
  post "/signin" =>  "sessions#create"
  get "/signout" => "sessions#destroy"

  get '/' => "home#index", as: :home_page
end
