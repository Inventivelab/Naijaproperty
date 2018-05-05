class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource_or_scope)
  #   dashboard_path
  # end

  # def after_sign_in_path_for(resource_or_scope)
  #   session.fetch 'user_return_to', user_path
  # end

  def after_sign_out_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  protected
    def configure_permitted_parameters
      added_attrs = [:first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :phone, :bio, :business_name, :address, :website, :gender, :company_address, :dateofbirth ])
    end

  private

    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end
end
