Rails.application.routes.draw do
  
  #users
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "users/:id" => "users#destroy"

  #sessions
  post "/sessions" => "sessions#create"

end
