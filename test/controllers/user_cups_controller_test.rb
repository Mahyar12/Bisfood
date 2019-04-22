require 'test_helper'

class UserCupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_cup = user_cups(:one)
  end

  test "should get index" do
    get user_cups_url
    assert_response :success
  end

  test "should get new" do
    get new_user_cup_url
    assert_response :success
  end

  test "should create user_cup" do
    assert_difference('UserCup.count') do
      post user_cups_url, params: { user_cup: { cup_count: @user_cup.cup_count, cup_id: @user_cup.cup_id, user_id: @user_cup.user_id } }
    end

    assert_redirected_to user_cup_url(UserCup.last)
  end

  test "should show user_cup" do
    get user_cup_url(@user_cup)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_cup_url(@user_cup)
    assert_response :success
  end

  test "should update user_cup" do
    patch user_cup_url(@user_cup), params: { user_cup: { cup_count: @user_cup.cup_count, cup_id: @user_cup.cup_id, user_id: @user_cup.user_id } }
    assert_redirected_to user_cup_url(@user_cup)
  end

  test "should destroy user_cup" do
    assert_difference('UserCup.count', -1) do
      delete user_cup_url(@user_cup)
    end

    assert_redirected_to user_cups_url
  end
end
