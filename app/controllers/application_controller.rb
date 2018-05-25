class ApplicationController < ActionController::Base
 #protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :last_name, :email, :phone_number, :password, :current_password, :avatar) }
  # end
end
