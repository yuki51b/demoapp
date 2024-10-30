Rails.application.routes.draw do
  resources :steps
  get 'boards/index'
  get 'boards/create'
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "tasks#index"

  resources :boards
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'images/ogp.png', to: 'images#ogp', as: 'images_ogp'

  resources :post


  # Defines the root path route ("/")
  # root "posts#index"
end
