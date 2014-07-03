Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root to:"galleries#index"

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :destroy] 
    #get "/images/new" => "images#new"
  end
  resources  :images, only: [:show, :edit, :update] do
    resources :comments, only: [:create]
    resource :like, only: [:create, :destroy]
    #post "/images" => "images#create"
  end

  resources :groups, only: [:new, :create, :index, :show, :destroy] do
    resource :group_membership, only: [:create, :destroy]
    resource :group_like, only: [:create, :destroy], as: :like
  end

    resources :tags, only: [:new, :create, :index, :show]

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

