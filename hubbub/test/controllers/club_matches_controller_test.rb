require 'test_helper'

class ClubMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club_match = club_matches(:one)
  end

  test "should get index" do
    get club_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_club_match_url
    assert_response :success
  end

  test "should create club_match" do
    assert_difference('ClubMatch.count') do
      post club_matches_url, params: { club_match: {club_id:@club_match.club_id, user_id:@club_match.user_id, matched:@club_match.matched  } }
    end

    assert_redirected_to club_match_url(ClubMatch.last)
  end

  test "should show club_match" do
    get club_match_url(@club_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_club_match_url(@club_match)
    assert_response :success
  end

  test "should update club_match" do
    patch club_match_url(@club_match), params: { club_match: {club_id:@club_match.club_id, user_id:@club_match.user_id, matched:@club_match.matched  } }
    assert_redirected_to club_match_url(@club_match)
  end

  test "should destroy club_match" do
    assert_difference('ClubMatch.count', -1) do
      delete club_match_url(@club_match)
    end

    assert_redirected_to club_matches_url
  end
end
