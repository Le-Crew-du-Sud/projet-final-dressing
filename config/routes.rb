Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root :to => 'static_pages#index'

  get 'search', to:"users#search"
  get 'crew', to:"static_pages#crew"
  get 'ethos', to:"static_pages#ethos"

  delete 'avatars/:id', to:"users#del_avatar", as: 'avatar'

  resources :users, only: [:edit, :show, :destroy, :update]

  resources :carts, only: [:create, :show, :destroy]

  patch 'pictures', to:"attires#update_pictures"
  delete 'pictures/:id', to:"attires#del_picture", as: 'picture'

  resources :attires

  resources :charges, only: [:new, :create]

end
