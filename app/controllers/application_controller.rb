class ApplicationController < ActionController::Base
 #protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :email, :nickname, :phone_number, :password, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :email, :nickname, :phone_number, :password, :current_password, :avatar])
  end
end
