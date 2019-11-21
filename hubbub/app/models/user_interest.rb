# Created 11/15/19 David Wing
# Edited 11/17/19 David Wing
# Edited 11/12/2019 by Neel Mansukhani: Fixed relation
class UserInterest < ApplicationRecord
    belongs_to :interest
    belongs_to :user
end
