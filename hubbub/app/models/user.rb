# Created 11/09/2019 by Sri Ramya Dandu
# Edited 11/10/2019 by Neel Mansukhani: Added admin role.
# Edited 11/12/2019 by Sri Ramya Dandu: Added validation for grad year
class User < ApplicationRecord
  validates :grad_year, length: {maximum: 4, minimum: 4}
  enum role: [:user, :club, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
