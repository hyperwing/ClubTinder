# Created 11/09/2019 by Sharon Qiu
# Edited 11/12/2019 by Neel Mansukhani: Added relations
class ClubMatch < ApplicationRecord
    belongs_to :club
    belongs_to :user
end
