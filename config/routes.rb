Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # #source: https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview#logout-links
  # devise_scope :user do
  #   delete 'users/sign_out', :to => 'devise/sessions#destroy', as: :destroy_user_session
  # end

  #get 'static_pages/index'

  root to: 'static_pages#index'

  resources :users, only: [:show]

end
