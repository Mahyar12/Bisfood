require "application_system_test_case"

class CupsTest < ApplicationSystemTestCase
  setup do
    @cup = cups(:one)
  end

  test "visiting the index" do
    visit cups_url
    assert_selector "h1", text: "Cups"
  end

  test "creating a Cup" do
    visit cups_url
    click_on "New Cup"

    fill_in "Name", with: @cup.name
    click_on "Create Cup"

    assert_text "Cup was successfully created"
    click_on "Back"
  end

  test "updating a Cup" do
    visit cups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @cup.name
    click_on "Update Cup"

    assert_text "Cup was successfully updated"
    click_on "Back"
  end

  test "destroying a Cup" do
    visit cups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cup was successfully destroyed"
  end
end
