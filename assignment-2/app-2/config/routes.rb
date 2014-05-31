Rails.application.routes.draw do

 # resources :user

  get '/users' => "user#index" 
  get '/user/profile' => "user#profile" 
  get '/search' => "home#search", as: :search_page
  get '/' => "home#index", as: :home_page

end
