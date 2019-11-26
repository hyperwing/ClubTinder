# Edited 11/26/2019 by Leah Gillespie

require 'test_helper'

class ClubTest < ActiveSupport::TestCase
  test "Club should save when created" do
    club = Club.new
    club.name = "test club"
    club.mission = "test mission"
    club.link = "www.osu.edu"
    club.location = "columbus"
    club.affiliations = "Special Interest"
    assert club.valid?
  end
  test "Club should store values in the correct places" do
    club = Club.new
    club.name = "test club"
    club.mission = "test mission"
    club.link = "www.osu.edu"
    club.location = "columbus"
    club.affiliations = "Special Interest"
    assert club.name == "test club"
    assert club.mission == "test mission"
    assert club.affiliations == "Special Interest"
  end
end
