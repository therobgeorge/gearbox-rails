Rails.application.routes.draw do
  
  #users
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "users/:id" => "users#destroy"

  #sessions
  post "/sessions" => "sessions#create"

  #gear
  get "/gears" => "gears#index"
  post "/gears" => "gears#create"
  get "/gears/:id" => "gears#show"
  patch "/gears/:id" => "gears#update"
  delete "gears/:id" => "gears#destroy"
  
  #images
  post "/images" => "images#create"
  delete "/images/:id" => "images#destroy"

end
