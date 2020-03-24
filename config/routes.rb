Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root :to => 'static_pages#index'

  get 'search', to:"users#search"

  resources :users, only: [:edit, :show]

  resources :carts, only: [:create, :show, :edit, :destroy]

  resources :attires do
    resources :itempicture, only: [:create, :destroy]
  end

  resources :charges, only: [:new, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ## >> We commented the route below to be allowed to run migrations (also check ./app/views/layout/application.html.erb) << ##
  # root to: "home#index"
end
