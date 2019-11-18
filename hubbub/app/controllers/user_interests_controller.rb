# Created 11/17/19 by David Wing

class UserInterestsController < ApplicationController
    def select_user_interests
        @interests = Interest.all
        # current user interests
        @user_interests = UserInterest.where(:user_id== current_user.id)

        @cur_u = current_user
    end
end
