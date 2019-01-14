require 'test_helper'

class CategoryAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_answer = category_answers(:one)
  end

  test "should get index" do
    get category_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_category_answer_url
    assert_response :success
  end

  test "should create category_answer" do
    assert_difference('CategoryAnswer.count') do
      post category_answers_url, params: { category_answer: { answer_id: @category_answer.answer_id, category_id: @category_answer.category_id } }
    end

    assert_redirected_to category_answer_url(CategoryAnswer.last)
  end

  test "should show category_answer" do
    get category_answer_url(@category_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_answer_url(@category_answer)
    assert_response :success
  end

  test "should update category_answer" do
    patch category_answer_url(@category_answer), params: { category_answer: { answer_id: @category_answer.answer_id, category_id: @category_answer.category_id } }
    assert_redirected_to category_answer_url(@category_answer)
  end

  test "should destroy category_answer" do
    assert_difference('CategoryAnswer.count', -1) do
      delete category_answer_url(@category_answer)
    end

    assert_redirected_to category_answers_url
  end
end
