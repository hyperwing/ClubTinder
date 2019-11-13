# Created 11/09/2019 by Sri Ramya Dandu
# Edited 11/10/2019 by Neel Mansukhani: Added admin role.
# Edited 11/12/2019 by Sri Ramya Dandu: Added validation for grad year
# Edited 11/12/2019 by Neel Mansukhani: Added relations
class User < ApplicationRecord
  validates :grad_year, length: {maximum: 4, minimum: 4}
  has_many :club_matches
  has_many :clubs, through: :club_matches

  enum role: [:user, :club, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Created 11/10/2019 by Neel Mansukhani
  # Sets default role to user.
  def set_default_role
    self.role ||= :user
  end

  # Created 11/12/2019 by Neel Mansukhani
  # Returns all clubs ordered by how likely a user is to like this club.
  def ordered_clubs
    other_users = self.class.all.where.not id: self.id
    clubs = Hash.new 0
    other_users.each do |user|
      common_clubs = user.clubs & self.clubs
      weight = common_clubs.length.to_f / user.clubs.length
      (user.clubs — common_clubs).each do |club|
        clubs[club] += weight
      end
    end
    sorted = clubs.sort_by{ |k, v| v }.reverse
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
