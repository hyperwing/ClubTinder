# Created 11/17/19 by David Wing

class UserInterestsController < ApplicationController
    def select_user_interests
        @interests = Interest.all

    end
end
