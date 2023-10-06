Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  # Add a route to update the user's last activity
  post '/update_activity', to: 'application#update_activity'
end
