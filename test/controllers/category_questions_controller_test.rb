require 'test_helper'

class CategoryQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_question = category_questions(:one)
  end

  test "should get index" do
    get category_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_category_question_url
    assert_response :success
  end

  test "should create category_question" do
    assert_difference('CategoryQuestion.count') do
      post category_questions_url, params: { category_question: { category_id: @category_question.category_id, question_id: @category_question.question_id } }
    end

    assert_redirected_to category_question_url(CategoryQuestion.last)
  end

  test "should show category_question" do
    get category_question_url(@category_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_question_url(@category_question)
    assert_response :success
  end

  test "should update category_question" do
    patch category_question_url(@category_question), params: { category_question: { category_id: @category_question.category_id, question_id: @category_question.question_id } }
    assert_redirected_to category_question_url(@category_question)
  end

  test "should destroy category_question" do
    assert_difference('CategoryQuestion.count', -1) do
      delete category_question_url(@category_question)
    end

    assert_redirected_to category_questions_url
  end
end
