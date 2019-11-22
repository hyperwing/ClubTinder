# Created 11/17/19 by David Wing

class UserInterestsController < ApplicationController

    # This is hit from submit button
    def select_user_interests
        @interests = Interest.all
        # current user interests
        @user_interests = UserInterest.where(:user_id => current_user.id)
        @cur_u = current_user

    end

    def create 
        logger.debug("creating new user_interest")

        new_interest = UserInterest.new
        new_interest.user_id = current_user.id
        new_interest.interest_id = @interest_info
        # new_interest.interest_id = 1

        if new_interest.save
            logger.debug("saved successfully")  
        else    
            logger.debug("failed to save")  
        end

        return true
        
    end

    def destroy
        logger.debug("deleting user_interest")

        UserInterest.find().destroy

        flash[:success] = "User_interest deleted"

        # redirect to preferences
        # render "users/preferences"
        return true;
    
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
                if (UserInterest.where(:interest_id => i_box.id).where(:user_id => current_user.id)).count == 0
                
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

                UserInterest.where(:user_id => current_user.id)
                    .where(:interest_id =>i_box.id).destroy_all
                
            end
        end
        redirect_to root_path
    end

end
