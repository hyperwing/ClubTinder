# Created 11/09/2019 by Sri Ramya Dandu
# Edited 11/10/2019 by Neel Mansukhani: Added admin role.
# Edited 11/12/2019 by Sri Ramya Dandu: Added validation for grad year
# Edited 11/12/2019 by Neel Mansukhani: Added relations
# Edited 11/17/2019 by Neel Mansukhani: Added validations
# Edited 11/18/2019 by David Wing: added user interest relations
# Edited 11/20/2019 by Neel Mansukhani: Added has_one club relation
# Edited 11/20/2019 by Neel Mansukhani: Fixed relations
class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :club_matches
  has_many :clubs, through: :club_matches

  has_many :user_interests
  has_many :interests, through: :user_interests

  has_one :club
  enum role: [:user, :club, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Created 11/10/2019 by Neel Mansukhani
  # Sets default role to user.
  def set_default_role
    self.role ||= :user
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
