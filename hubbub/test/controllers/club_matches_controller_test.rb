require 'test_helper'

class ClubMatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get matches" do
    get club_matches_matches_url
    assert_response :success
  end

end
