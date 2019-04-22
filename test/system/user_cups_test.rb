require "application_system_test_case"

class UserCupsTest < ApplicationSystemTestCase
  setup do
    @user_cup = user_cups(:one)
  end

  test "visiting the index" do
    visit user_cups_url
    assert_selector "h1", text: "User Cups"
  end

  test "creating a User cup" do
    visit user_cups_url
    click_on "New User Cup"

    fill_in "Cup count", with: @user_cup.cup_count
    fill_in "Cup", with: @user_cup.cup_id
    fill_in "User", with: @user_cup.user_id
    click_on "Create User cup"

    assert_text "User cup was successfully created"
    click_on "Back"
  end

  test "updating a User cup" do
    visit user_cups_url
    click_on "Edit", match: :first

    fill_in "Cup count", with: @user_cup.cup_count
    fill_in "Cup", with: @user_cup.cup_id
    fill_in "User", with: @user_cup.user_id
    click_on "Update User cup"

    assert_text "User cup was successfully updated"
    click_on "Back"
  end

  test "destroying a User cup" do
    visit user_cups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User cup was successfully destroyed"
  end
end
