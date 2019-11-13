
# Edited 11/12/2019 by Neel Mansukhani: Added relations
class ClubMatch < ApplicationRecord
    belongs_to :user
    belongs_to :movie
end
