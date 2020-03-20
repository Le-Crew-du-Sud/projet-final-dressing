Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # #source: https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview#logout-links
  # devise_scope :user do
  #   delete 'users/sign_out', :to => 'devise/sessions#destroy', as: :destroy_user_session
  # end

  root to: 'static_pages#index'

  devise_for :users

  get 'static_pages/index'


  get 'search', to:"users#search"
  resources :users, only: [:edit, :show]
  resources :attires do
    resources :itempicture, only: [:create, :destroy]
  end

end
