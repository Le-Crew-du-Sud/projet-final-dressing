class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :cart_number

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:avatar, :first_name, :last_name, :about_me, :city_id, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:avatar, :first_name, :last_name, :about_me, :city_id, :email, :password, :password_confirmation, :current_password)}
  end

  #source: https://www.rubydoc.info/github/plataformatec/devise/Devise%2FControllers%2FHelpers:sign_in_and_redirect
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path #edit_user_registration_path
  end

  def cart_number
    if user_signed_in?
      @cart_number = current_user.carts.where(order_id: 0).length
    end
  end
end
