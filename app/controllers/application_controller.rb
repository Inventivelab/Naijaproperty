class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :phone, :bio, :business_name, :address, :website ])
    end
end
