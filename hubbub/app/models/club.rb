# File Created 11/12/2019 by Neel Mansukhani
# Edited 11/12/2019 by Neel Mansukhani: Added relations
class Club < ApplicationRecord
    has_many :club_matches
    has_many :users, through: :club_matches
end
