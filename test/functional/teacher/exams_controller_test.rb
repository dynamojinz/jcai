# -*- encoding : utf-8 -*-
require 'test_helper'

class Teacher::ExamsControllerTest < ActionController::TestCase
  setup do
    @teacher_exam = teacher_exams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_exams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_exam" do
    assert_difference('Teacher::Exam.count') do
      post :create, :teacher_exam => {  }
    end

    assert_redirected_to teacher_exam_path(assigns(:teacher_exam))
  end

  test "should show teacher_exam" do
    get :show, :id => @teacher_exam
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @teacher_exam
    assert_response :success
  end

  test "should update teacher_exam" do
    put :update, :id => @teacher_exam, :teacher_exam => {  }
    assert_redirected_to teacher_exam_path(assigns(:teacher_exam))
  end

  test "should destroy teacher_exam" do
    assert_difference('Teacher::Exam.count', -1) do
      delete :destroy, :id => @teacher_exam
    end

    assert_redirected_to teacher_exams_path
  end
end
