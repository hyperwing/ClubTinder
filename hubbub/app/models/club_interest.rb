# Edited 11/20/2019 by Neel Mansukhani: Added associations
class ClubInterest < ApplicationRecord
    belongs_to :interest
    belongs_to :club
end
