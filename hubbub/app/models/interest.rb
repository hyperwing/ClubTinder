# Created 11/15/19 by David Wing
# Edited 11/19/19 by David Wing
# Edited 11/20/19 by David Wing
# Edited 11/12/2019 by Neel Mnsukhani: Added relations for club interests
class Interest < ApplicationRecord
    has_many :user_interests 
    has_many :users, through: :user_interests
    has_many :club_interests 
    has_many :clubs, through: :club_interests
end
