# Created 11/21/2019 by Neel Mansukhani

class ClubInterestsController < ApplicationController
  def select_club_interests
    if current_user.club_id.nil?
      redirect_to new_club_path
    end
    @interests = Interest.all
    @club_interests = ClubInterest.where(:club_id => current_user.club_id)
    @cur_u = current_user
    @club = Club.find_by :id => current_user.club_id

  end

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

  def handle_check_boxes

    tag_ids = params[:tag_ids]
    logger.debug("tag_ids: " +tag_ids.to_s)

    @interests = Interest.all
    # if box checked, add to model, else destroy from model
    @interests.each do |i_box|
        # Set the interest information from form to instance variable
        @interest_info = i_box.id

        logger.debug("handling " +i_box.name.to_s)
        logger.debug("tag_ids: " +tag_ids.to_s)

        if tag_ids.include? i_box.id.to_s

            logger.debug("creating new user_interest")

            # Where user_interests already has an entry for user
            if (ClubInterest.where(:interest_id => i_box.id).where(:club_id => current_user.club_id)).count == 0
            
                new_interest = UserInterest.new
                new_interest.user_id = current_user.id
                new_interest.interest_id = i_box.id
        
                if new_interest.save
                    logger.debug("saved successfully")  
                else    
                    logger.debug("failed to save")  
                end
            end

        else
            logger.debug("deleting user_interest")

            ClubInterest.where(:club_id => current_user.club_id)
                .where(:interest_id =>i_box.id).destroy_all
            
        end
    end
    redirect_to clubs_my_club_path
end

end
