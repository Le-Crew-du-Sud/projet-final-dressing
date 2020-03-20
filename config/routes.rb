Rails.application.routes.draw do




  devise_for :users

  get 'static_pages/index'

  root :to => 'static_pages#index'

  resources :users, only: [:edit, :show]
  resources :attires

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ## >> We commented the route below to be allowed to run migrations (also check ./app/views/layout/application.html.erb) << ##
  # root to: "home#index"
end
 
