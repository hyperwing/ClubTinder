require "application_system_test_case"

class ClubMatchesTest < ApplicationSystemTestCase
  setup do
    @club_match = club_matches(:one)
  end

  test "visiting the index" do
    visit club_matches_url
    assert_selector "h1", text: "Club Matches"
  end

  test "creating a Club match" do
    visit club_matches_url
    click_on "New Club Match"

    click_on "Create Club match"

    assert_text "Club match was successfully created"
    click_on "Back"
  end

  test "updating a Club match" do
    visit club_matches_url
    click_on "Edit", match: :first

    click_on "Update Club match"

    assert_text "Club match was successfully updated"
    click_on "Back"
  end

  test "destroying a Club match" do
    visit club_matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Club match was successfully destroyed"
  end
end
