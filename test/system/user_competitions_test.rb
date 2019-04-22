require "application_system_test_case"

class UserCompetitionsTest < ApplicationSystemTestCase
  setup do
    @user_competition = user_competitions(:one)
  end

  test "visiting the index" do
    visit user_competitions_url
    assert_selector "h1", text: "User Competitions"
  end

  test "creating a User competition" do
    visit user_competitions_url
    click_on "New User Competition"

    fill_in "Competition", with: @user_competition.competition_id
    fill_in "Points", with: @user_competition.points
    fill_in "Status", with: @user_competition.status
    fill_in "User", with: @user_competition.user_id
    click_on "Create User competition"

    assert_text "User competition was successfully created"
    click_on "Back"
  end

  test "updating a User competition" do
    visit user_competitions_url
    click_on "Edit", match: :first

    fill_in "Competition", with: @user_competition.competition_id
    fill_in "Points", with: @user_competition.points
    fill_in "Status", with: @user_competition.status
    fill_in "User", with: @user_competition.user_id
    click_on "Update User competition"

    assert_text "User competition was successfully updated"
    click_on "Back"
  end

  test "destroying a User competition" do
    visit user_competitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User competition was successfully destroyed"
  end
end
