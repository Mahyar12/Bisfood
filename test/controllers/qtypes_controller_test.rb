require 'test_helper'

class QtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qtype = qtypes(:one)
  end

  test "should get index" do
    get qtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_qtype_url
    assert_response :success
  end

  test "should create qtype" do
    assert_difference('Qtype.count') do
      post qtypes_url, params: { qtype: { name: @qtype.name } }
    end

    assert_redirected_to qtype_url(Qtype.last)
  end

  test "should show qtype" do
    get qtype_url(@qtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_qtype_url(@qtype)
    assert_response :success
  end

  test "should update qtype" do
    patch qtype_url(@qtype), params: { qtype: { name: @qtype.name } }
    assert_redirected_to qtype_url(@qtype)
  end

  test "should destroy qtype" do
    assert_difference('Qtype.count', -1) do
      delete qtype_url(@qtype)
    end

    assert_redirected_to qtypes_url
  end
end
