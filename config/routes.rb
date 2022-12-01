Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :playlists
  post '/authorize_spotify', to: 'playlists#authorize_spotify'
  post '/access_key', to: 'playlists#access_key'
  post '/permission_key', to: 'playlists#permission_key'
end
