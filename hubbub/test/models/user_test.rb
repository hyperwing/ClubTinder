# Edited 11/25/2019 by Sri Ramya Dandu
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
      @user = users(:user)
      @admin = users(:admin)
  end

  test "user should not save without any attributes" do
    user = User.new
    assert_not user.valid?
  end

  test "user should not save without email" do
    user = User.new
    user.first_name = "Sri"
    user.last_name= "Dandu"
    user.gender = "Female"
    user.grad_year= "2021"
    user.role = "user"
    assert_not user.valid?
  end

  test "user should not save without first name" do
    user = User.new
    user.email = "dandu.7@osu.edu"
    user.last_name= "Dandu"
    user.gender = "Female"
    user.grad_year= "2021"
    user.role = "user"
    assert_not user.valid?
  end

  test "user should not save without last name" do
    user = User.new
    user.email = "dandu.7@osu.edu"
    user.first_name = "Sri"
    user.gender = "Female"
    user.grad_year= "2021"
    user.role = "user"
    assert_not user.valid?
  end

  test "user should save with all required attributes filled in" do
    assert @user.valid?
  end

  test "admin should save with all required attributes filled in" do
    assert @admin.valid?
  end

end
