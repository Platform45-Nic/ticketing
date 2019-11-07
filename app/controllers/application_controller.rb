class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.type == "Admin"
      stored_location_for(resource) || admins_profile_path
    elsif resource.type == "Normal"
      stored_location_for(resource) || normals_profile_path
    else
      flash.now[:error] = "Please Sign In or Sign Up!"
      root_path
    end
  end

end
