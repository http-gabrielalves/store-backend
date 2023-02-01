Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :measurement_units
      resources :users
      resources :products 
      post '/check_email', to: 'users#check_email'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
