# Edited 11/08/2019 by Sri Ramya Dandu: Added function to allow more paramters of info 
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  # Created 11/16/2019 by Neel Mansukhani
  # Edited 11/20/2019 by Neel Mansukhani: Accounts for interests
  # GET /clubs/choose
  def choose
    other_users = User.all.where.not id: current_user.id
    clubs = Hash.new 0
    other_users.each do |other_user|
      other_user_clubs = Club.left_joins(:club_matches,:users).where(:users=> {id:other_user.id},:club_matches=>{matched:1})
      current_user_clubs = Club.left_joins(:club_matches,:users).where(:users=> {id:current_user.id},:club_matches=>{matched:1})

      common_clubs = other_user_clubs & current_user_clubs
      weight = (common_clubs.length.to_f * 100/ other_user_clubs.length)
      other_user_clubs.each do |club|
        if !common_clubs.include?(club)&& !current_user_clubs.include?(club)
          clubs[club] += weight
        end
      end
    end

    clubs.each do |club, v|
      common_interest_count = (current_user.interests & club.interests).length
      if clubs[club] >= 1
        clubs[club] = clubs[club] + ((5 * common_interest_count)/clubs[club]) + (rand(-14..14)/7)
      else
        clubs[club] = clubs[club] + (10 * common_interest_count) + (rand(-14..14).to_f/7)
      end
      clubs[club] = clubs[club].round(2)
    end
    @clubs = clubs.sort_by{ |k, v| v }.reverse
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :grad_year, :gender, :role])
  end
#   def after_sign_up_path_for(resource_or_scope)
#     '/clubs/new'
#   end
end
