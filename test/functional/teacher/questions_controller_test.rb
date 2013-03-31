require 'test_helper'

class Teacher::QuestionsControllerTest < ActionController::TestCase
  setup do
    @teacher_question = teacher_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_question" do
    assert_difference('Teacher::Question.count') do
      post :create, teacher_question: {  }
    end

    assert_redirected_to teacher_question_path(assigns(:teacher_question))
  end

  test "should show teacher_question" do
    get :show, id: @teacher_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_question
    assert_response :success
  end

  test "should update teacher_question" do
    put :update, id: @teacher_question, teacher_question: {  }
    assert_redirected_to teacher_question_path(assigns(:teacher_question))
  end

  test "should destroy teacher_question" do
    assert_difference('Teacher::Question.count', -1) do
      delete :destroy, id: @teacher_question
    end

    assert_redirected_to teacher_questions_path
  end
end
