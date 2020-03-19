Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ## >> We commented the route below to be allowed to run migrations (also check ./app/views/layout/application.html.erb) << ##
  # root to: "home#index"
end
