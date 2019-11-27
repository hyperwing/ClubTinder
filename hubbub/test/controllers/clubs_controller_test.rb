require 'test_helper'

class ClubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club = clubs(:one)
  end

  test "should get new" do
    get new_club_url
    assert_response :success
  end

  test "should destroy club" do
    assert_difference('Club.count', -1) do
      delete club_url(@club)
    end

    assert_redirected_to clubs_url
  end
end
