require 'test_helper'

class Student::ExamsControllerTest < ActionController::TestCase
  setup do
    @student_exam = student_exams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_exams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_exam" do
    assert_difference('Student::Exam.count') do
      post :create, :student_exam => {  }
    end

    assert_redirected_to student_exam_path(assigns(:student_exam))
  end

  test "should show student_exam" do
    get :show, :id => @student_exam
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @student_exam
    assert_response :success
  end

  test "should update student_exam" do
    put :update, :id => @student_exam, :student_exam => {  }
    assert_redirected_to student_exam_path(assigns(:student_exam))
  end

  test "should destroy student_exam" do
    assert_difference('Student::Exam.count', -1) do
      delete :destroy, :id => @student_exam
    end

    assert_redirected_to student_exams_path
  end
end
