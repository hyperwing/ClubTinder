# Edited 11/26/2019 by Neel Mansukhani
require 'test_helper'

class InterestTest < ActiveSupport::TestCase
  test "interest should be valid" do
    interest = Interest.new
    interest.name = "Test Interest"
    assert interest.valid?
  end
end
