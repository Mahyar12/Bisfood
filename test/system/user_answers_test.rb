require "application_system_test_case"

class UserAnswersTest < ApplicationSystemTestCase
  setup do
    @user_answer = user_answers(:one)
  end

  test "visiting the index" do
    visit user_answers_url
    assert_selector "h1", text: "User Answers"
  end

  test "creating a User answer" do
    visit user_answers_url
    click_on "New User Answer"

    fill_in "Competition", with: @user_answer.competition_id
    fill_in "Question", with: @user_answer.question_id
    fill_in "Status", with: @user_answer.status
    fill_in "User", with: @user_answer.user_id
    click_on "Create User answer"

    assert_text "User answer was successfully created"
    click_on "Back"
  end

  test "updating a User answer" do
    visit user_answers_url
    click_on "Edit", match: :first

    fill_in "Competition", with: @user_answer.competition_id
    fill_in "Question", with: @user_answer.question_id
    fill_in "Status", with: @user_answer.status
    fill_in "User", with: @user_answer.user_id
    click_on "Update User answer"

    assert_text "User answer was successfully updated"
    click_on "Back"
  end

  test "destroying a User answer" do
    visit user_answers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User answer was successfully destroyed"
  end
end
