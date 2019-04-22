require 'test_helper'

class CupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cup = cups(:one)
  end

  test "should get index" do
    get cups_url
    assert_response :success
  end

  test "should get new" do
    get new_cup_url
    assert_response :success
  end

  test "should create cup" do
    assert_difference('Cup.count') do
      post cups_url, params: { cup: { name: @cup.name } }
    end

    assert_redirected_to cup_url(Cup.last)
  end

  test "should show cup" do
    get cup_url(@cup)
    assert_response :success
  end

  test "should get edit" do
    get edit_cup_url(@cup)
    assert_response :success
  end

  test "should update cup" do
    patch cup_url(@cup), params: { cup: { name: @cup.name } }
    assert_redirected_to cup_url(@cup)
  end

  test "should destroy cup" do
    assert_difference('Cup.count', -1) do
      delete cup_url(@cup)
    end

    assert_redirected_to cups_url
  end
end
