Scrapbook::Application.routes.draw do

  root to: 'albums#index'

  get "signup" => "users#new", :as => "signup"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  resources :users
  resources :albums do
    resources :photos do
      resources :tags
    end
  end
  resources :sessions
end
