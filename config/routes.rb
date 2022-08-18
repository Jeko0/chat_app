Rails.application.routes.draw do
  get 'users/show'
  resources :rooms do 
    resources :messages
  end

  root 'pages#home'
  devise_for :users

  devise_scope :user do 
    get "users", to: "devise/sessions#new"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "users/:id", to: "users#show", as: "user"
end
