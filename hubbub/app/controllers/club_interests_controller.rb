# Created 11/21/2019 by Neel Mansukhani
# Edited 11/26/2019 by Neel Mansukhani: Added documentation

class ClubInterestsController < ApplicationController

  # Created 11/21/2019 by Neel Mansukhani
  # Shows all interests
  def select_club_interests
    if current_user.club_id.nil?
      redirect_to new_club_path
    else
      @interests = Interest.all
      @club_interests = ClubInterest.where(:club_id => current_user.club_id)
      @cur_u = current_user
      @club = Club.find_by :id => current_user.club_id
    end

  end

  # Created 11/21/2019 by Neel Mansukhani
  # Creates a club interests.
  def create
    @clubInterest = ClubInterest.new(club_params)
    respond_to do |format|
      if @clubInterest.save
        format.html { redirect_to @clubInterest, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @clubInterest }
      else
        format.html { render :new }
        format.json { render json: @clubInterest.errors, status: :unprocessable_entity }
      end
    end
  end

  # Created 11/21/2019 by Neel Mansukhani
  # Fills checkboxes based on club interests.
  def handle_check_boxes

    tag_ids = params[:tag_ids]
    @interests = Interest.all
    # if box checked, add to model, else destroy from model
    @interests.each do |i_box|
        # Set the interest information from form to instance variable
        @interest_info = i_box.id

        if tag_ids.include? i_box.id.to_s

            # Where user_interests already has an entry for user
            if (ClubInterest.where(:interest_id => i_box.id).where(:club_id => current_user.club_id)).count == 0
            
                new_interest = ClubInterest.new
                new_interest.club_id = current_user.club_id
                new_interest.interest_id = i_box.id
      
            end

        else
            ClubInterest.where(:club_id => current_user.club_id)
                .where(:interest_id =>i_box.id).destroy_all
            
        end
    end
    redirect_to clubs_my_club_path
end

end
