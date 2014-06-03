Rails.application.routes.draw do
 get '/search' => "welcome#search", as: :search_page
 get '/' => "welcome#index", as: :home_page
end
