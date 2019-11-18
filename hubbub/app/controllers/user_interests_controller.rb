# Created 11/17/19 by David Wing

class UserInterestsController < ApplicationController

    # This is hit from submit button
    def select_user_interests
        @interests = Interest.all
        # current user interests
        @user_interests = UserInterest.where(:user_id== current_user.id)
        @cur_u = current_user


        tag_ids = params[:tag_ids]



    end

    def handle_check_boxes
        @interests = Interest.all

        # if box checked, add to model, else destroy from model
        @interests.each do |i_box|
            if tag_ids.include? i_box.id
                create
            else
                destroy
            end
        end
    end

    def update
        @user_interests = UserInterest.find(params[:id])
        if @user_interests.update(user_params)
          redirect_to @user_interests
        end    
    end

    def destroy
        UserInterest.find(params[:id]).destroy

        flash[:success] = "User deleted"
        redirect_to users_url
    
    end

    def create 
        @new_interest = UserInterest.new(new_user_interest_params)

        if @new_interest.save
            render :show
        else  
            render :new
        end
    end

end
