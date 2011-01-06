Xchg::Application.routes.draw do
  root :to => "items#index"
  match '/auth/:provider/callback' => 'authentications#create'
  match '/signout' => 'authentications#destroy'
  resources :items
end
