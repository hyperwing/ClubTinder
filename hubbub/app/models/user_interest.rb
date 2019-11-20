# Created 11/15/19 David Wing
# Edited 11/17/19 David Wing
class UserInterest < ApplicationRecord
    belongs_to :interest
    belongs_to :user, foreign_key: 'interest_id'
end
