# Created 11/18/2019 by David Wing 

require 'test_helper'

class UserInterestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_interest = user_interests(:one)
    sign_in users(:user)
  end

  test "should be able to edit interests" do
    get  users_select_user_interests_url
    assert_response :success
  end
end
