Rails.application.routes.draw do
  get "/" => "galleries#index"
  get "/galleries/new" => "galleries#new"
  get "/galleries/:id" => "galleries#show"
  post "/galleries" => "galleries#create"

end
