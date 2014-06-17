Rails.application.routes.draw do

root to:"galleries#index"
resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
  get "/images/new" => "images#new"
  post "/images" => "images#create"
end

end

=begin
  get "/" => "galleries#index"
  get "/galleries/new" => "galleries#new"
  get "/galleries/:id" => "galleries#show"
  post "/galleries" => "galleries#create"
  get "/galleries/:id/edit" => "galleries#edit"
  delete "/galleries/:id" => "galleries#destroy"
  patch "/galleries/:id" => "galleries#update"
  get "/galleries/:id/images/new" => "images#new"
=end

