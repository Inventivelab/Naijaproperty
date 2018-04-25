class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  protected
    def configure_permitted_parameters
      added_attrs = [:first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :phone, :bio, :business_name, :address, :website ])
    end

#     helper FilepickerRails::Engine.helpers
end
