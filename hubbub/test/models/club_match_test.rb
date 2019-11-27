# Edited 10/26/2019 by Sharon Qiu: added test cases for club match model
require 'test_helper'

class ClubMatchTest < ActiveSupport::TestCase

  test "club_match should not save without any attributes" do
    club_match = ClubMatch.new
    assert_not club_match.valid?
  end

  test "user should not save without a match" do
    club_match = ClubMatch.new
    club_match.user_id = 1
    club_match.club_id = 1
    assert_not club_match.valid?
  end

  test "user should not save with a string for user_id" do
    club_match = ClubMatch.new
    club_match.user_id = "hi"
    club_match.club_id = 1
    club_match.matched = 1
    assert_not club_match.valid?
  end

  test "user should not save with a string for club_id" do
    club_match = ClubMatch.new
    club_match.user_id = 1
    club_match.club_id = "hi"
    club_match.matched = 1
    assert_not club_match.valid?
  end

end
