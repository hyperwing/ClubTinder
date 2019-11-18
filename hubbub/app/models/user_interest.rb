# Created 11/15/19 David Wing
# Edited 11/17/19 David Wing
class UserInterest < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    belongs_to :interest, foreign_key: 'id'
end
