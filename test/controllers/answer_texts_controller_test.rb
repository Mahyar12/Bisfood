require 'test_helper'

class AnswerTextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer_text = answer_texts(:one)
  end

  test "should get index" do
    get answer_texts_url
    assert_response :success
  end

  test "should get new" do
    get new_answer_text_url
    assert_response :success
  end

  test "should create answer_text" do
    assert_difference('AnswerText.count') do
      post answer_texts_url, params: { answer_text: { atext: @answer_text.atext } }
    end

    assert_redirected_to answer_text_url(AnswerText.last)
  end

  test "should show answer_text" do
    get answer_text_url(@answer_text)
    assert_response :success
  end

  test "should get edit" do
    get edit_answer_text_url(@answer_text)
    assert_response :success
  end

  test "should update answer_text" do
    patch answer_text_url(@answer_text), params: { answer_text: { atext: @answer_text.atext } }
    assert_redirected_to answer_text_url(@answer_text)
  end

  test "should destroy answer_text" do
    assert_difference('AnswerText.count', -1) do
      delete answer_text_url(@answer_text)
    end

    assert_redirected_to answer_texts_url
  end
end
