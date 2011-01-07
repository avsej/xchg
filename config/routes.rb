Xchg::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  match '/signout' => 'authentications#destroy'
  match '/items/(:public_token)' => 'items#index', :via => :get, :as => :items
  match '/items' => 'items#create', :via => :post, :as => :upload
  root :to => "items#index"
end
