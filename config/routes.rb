Rails.application.routes.draw do

  get "/" => "galleries#index"
  get "/galleries/new" => "galleries#new"
  get "/galleries/:id" => "galleries#show"
  post "/galleries" => "galleries#create"
  get "/galleries/:id/edit" => "galleries#edit"
  delete "/galleries/:id" => "galleries#destroy"
  patch "/galleries/:id" => "galleries#update"


end
