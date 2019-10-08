class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.type == "Admin"
      stored_location_for(resource) || admins_profile_path
    elsif resource.type == "Normal"
      stored_location_for(resource) || normals_profile_path
    else
      root_path
    end
  end

  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :

  protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :type, :email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :type, :email, :password, :current_password])
      end
end
