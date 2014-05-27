Rails.application.routes.draw do

#  get "/profile_view" => "home#profile_view", as: :profile_view
#  get "/single_view" => "home#single_view", as: :single_view
#  get '/' => "welcome#index", as: :home_page

root "welcome#index"

match ':controller(/:action(/:id))', :via => :get

end
