require "application_system_test_case"

class GameProfilesTest < ApplicationSystemTestCase
  setup do
    @game_profile = game_profiles(:one)
  end

  test "visiting the index" do
    visit game_profiles_url
    assert_selector "h1", text: "Game Profiles"
  end

  test "creating a Game profile" do
    visit game_profiles_url
    click_on "New Game Profile"

    fill_in "Level", with: @game_profile.level
    fill_in "Money", with: @game_profile.money
    fill_in "Points", with: @game_profile.points
    click_on "Create Game profile"

    assert_text "Game profile was successfully created"
    click_on "Back"
  end

  test "updating a Game profile" do
    visit game_profiles_url
    click_on "Edit", match: :first

    fill_in "Level", with: @game_profile.level
    fill_in "Money", with: @game_profile.money
    fill_in "Points", with: @game_profile.points
    click_on "Update Game profile"

    assert_text "Game profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Game profile" do
    visit game_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game profile was successfully destroyed"
  end
end
