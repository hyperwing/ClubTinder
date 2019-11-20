# Edited 11/08/2019 by Sri Ramya Dandu: Added function to allow more paramters of info 
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Created 11/16/2019 by Neel Mansukhani
  # GET /clubs/choose
  def choose
    other_users = User.all.where.not id: current_user.id
    clubs = Hash.new 0
    other_users.each do |other_user|
      common_clubs = other_user.clubs & current_user.clubs
      weight = (common_clubs.length.to_f * 100/ other_user.clubs.length).round(2)
      other_user.clubs.each do |club|
        if !common_clubs.include? club
          clubs[club] += weight
        end
      end
    end
    @clubs = clubs.sort_by{ |k, v| v }.reverse
    return @clubs
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :grad_year, :gender])
  end
end
