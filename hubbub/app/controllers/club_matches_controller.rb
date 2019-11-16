# Created 11/09/2019 by Sharon Qiu
# Controller for club matches page

class ClubMatchesController < ApplicationController
  #before_action :user_signed_in?
  
  def matches
    current_user = 1
    @matched = ClubMatch.where(user_id: current_user).where(matched: 1)
    
    @matched_clubs = ClubMatch.joins(:clubs).where
    
  end

end
