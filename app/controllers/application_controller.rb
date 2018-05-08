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
  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.superadmin?
      redirect_to root_path, alert: "Unauthorized access!!"
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  def require_admin
    unless current_user_admin?
      redirect_to root_url, alert: "Unauthorized access!!"
    end
  end

  def current_user_admin?
   current_user && current_user.admin?
  end
  helper_method :current_user_admin?

  def require_editor
    unless current_user_editor?
      redirect_to root_url, alert: "Unauthorized access!!"
    end
  end

  def current_user_editor?
   current_user && current_user.editor?
  end
  helper_method :current_user_editor?

  def require_moderator
    unless current_user_moderator?
      redirect_to root_url, alert: "Unauthorized access!!"
    end
  end

  def current_user_moderator?
   current_user && current_user.moderator?
  end
  helper_method :current_user_moderator?

  def current_user_banned?
   current_user && current_user.banned?
  end
  helper_method :current_user_banned?

  protected
    def configure_permitted_parameters
      added_attrs = [:first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :phone, :bio, :business_name, :address, :website, :gender, :company_address, :dateofbirth, :admin, :moderator, :editor, :banned, :status ])
    end

  private

    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end
end
