require "application_system_test_case"

class ClubsTest < ApplicationSystemTestCase
  setup do
    @club = clubs(:one)
  end

  test "visiting the index" do
    visit clubs_url
    assert_selector "h1", text: "Clubs"
  end

  test "creating a Club" do
    visit clubs_url
    click_on "New Club"

    fill_in "Affiliations", with: @club.affiliations
    fill_in "Img url", with: @club.img_url
    fill_in "Link", with: @club.link
    fill_in "Location", with: @club.location
    fill_in "Mission", with: @club.mission
    fill_in "Name", with: @club.name
    fill_in "Other", with: @club.other
    fill_in "String", with: @club.string
    click_on "Create Club"

    assert_text "Club was successfully created"
    click_on "Back"
  end

  test "updating a Club" do
    visit clubs_url
    click_on "Edit", match: :first

    fill_in "Affiliations", with: @club.affiliations
    fill_in "Img url", with: @club.img_url
    fill_in "Link", with: @club.link
    fill_in "Location", with: @club.location
    fill_in "Mission", with: @club.mission
    fill_in "Name", with: @club.name
    fill_in "Other", with: @club.other
    fill_in "String", with: @club.string
    click_on "Update Club"

    assert_text "Club was successfully updated"
    click_on "Back"
  end

  test "destroying a Club" do
    visit clubs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Club was successfully destroyed"
  end
end
