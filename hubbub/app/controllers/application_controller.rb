# Edited 11/08/2019 by Sri Ramya Dandu: Added function to allow more paramters of info 
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :grad_year, :gender])
  end
end
