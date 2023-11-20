Rails.application.routes.draw do
  #Todo Routes
  get "/todos" => "todos#index"
  get "/todos/:id" => "todos#show"
  post "/todos" => "todos#create"
  patch "/todos/:id" => "todos#update"
  delete "/todos/:id" => "todos#destroy"

  #User Routes
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  #Categories Routes
  get "/categories" => "categories#index"
  get "/categories/:id" => "categories#show"
  post "/categories" => "categories#create"
  patch "/categories/:id" => "categories#update"
  delete "/categories/:id" => "categories#destroy"

  #Session Route
  post "/sessions" => "sessions#create"
end
