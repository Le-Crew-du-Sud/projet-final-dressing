Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root :to => 'static_pages#index'

  get 'search', to:"users#search"
  get 'crew', to:"static_pages#crew"
  #patch 'avatars', to:"users#update_avatar", as: 'avatar'
  delete 'avatars/:id', to:"users#del_avatar", as: 'avatar'

  resources :users, only: [:edit, :show, :destroy, :update]

  resources :carts, only: [:create, :show, :edit, :destroy]

  patch 'pictures', to:"attires#update_pictures"
  delete 'pictures/:id', to:"attires#del_picture", as: 'picture'

  resources :attires

  resources :charges, only: [:new, :create]
  resources :orders, only: [:edit, :show, :destroy, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ## >> We commented the route below to be allowed to run migrations (also check ./app/views/layout/application.html.erb) << ##
  # root to: "home#index"
end
