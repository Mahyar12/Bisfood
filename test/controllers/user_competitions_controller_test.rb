require 'test_helper'

class UserCompetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_competition = user_competitions(:one)
  end

  test "should get index" do
    get user_competitions_url
    assert_response :success
  end

  test "should get new" do
    get new_user_competition_url
    assert_response :success
  end

  test "should create user_competition" do
    assert_difference('UserCompetition.count') do
      post user_competitions_url, params: { user_competition: { competition_id: @user_competition.competition_id, points: @user_competition.points, status: @user_competition.status, user_id: @user_competition.user_id } }
    end

    assert_redirected_to user_competition_url(UserCompetition.last)
  end

  test "should show user_competition" do
    get user_competition_url(@user_competition)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_competition_url(@user_competition)
    assert_response :success
  end

  test "should update user_competition" do
    patch user_competition_url(@user_competition), params: { user_competition: { competition_id: @user_competition.competition_id, points: @user_competition.points, status: @user_competition.status, user_id: @user_competition.user_id } }
    assert_redirected_to user_competition_url(@user_competition)
  end

  test "should destroy user_competition" do
    assert_difference('UserCompetition.count', -1) do
      delete user_competition_url(@user_competition)
    end

    assert_redirected_to user_competitions_url
  end
end
