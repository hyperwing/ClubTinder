# Edited 11/26/2019 by Neel Mansukhani
require 'test_helper'

class ClubInterestTest < ActiveSupport::TestCase
  test "club interest shouldn't be valid without any information" do
    club_interest = ClubInterest.new
    assert_not club_interest.valid?
  end

  test "club interest shouldn't be valid without club id" do
    club_interest = ClubInterest.new
    club_interest.interest_id = 1;
    assert_not club_interest.valid?
  end

  test "club interest shouldn't be valid without interest id" do
    club_interest = ClubInterest.new
    club_interest.club_id = 1;
    assert_not club_interest.valid?
  end
end
