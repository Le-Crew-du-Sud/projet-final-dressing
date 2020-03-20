Rails.application.routes.draw do



  get 'attires/index'
  get 'attires/create'
  get 'attires/new'
  post 'attires/create'
  devise_for :users

  get 'static_pages/index'

  root :to => 'static_pages#index'

  resources :users, only: [:edit, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ## >> We commented the route below to be allowed to run migrations (also check ./app/views/layout/application.html.erb) << ##
  # root to: "home#index"
end
