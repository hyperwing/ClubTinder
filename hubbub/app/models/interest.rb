# Created 11/15/19 by David Wing
# Edited 11/19/19 by David Wing
# Edited 11/20/19 by David Wing

class Interest < ApplicationRecord
    has_many :user_interests 
    has_many :users, through: :user_interests
end
