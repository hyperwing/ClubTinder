# Edited 11/26/2019 by Leah Gillespie
require 'test_helper'

class UserInterestTest < ActiveSupport::TestCase
   test "user interest shouldn't be valid without any information" do
      user_interest = UserInterest.new
      assert_not user_interest.valid?
    end

    test "user interest shouldn't be valid without interest id" do
      user_interest = UserInterest.new
      user_interest.interest_id = 1;
      assert_not user_interest.valid?
    end

    test "user interest shouldn't be valid without user id" do
      user_interest = UserInterest.new
      user_interest.user_id = 1;
      assert_not user_interest.valid?
    end
end
