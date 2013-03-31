# -*- encoding : utf-8 -*-
require 'test_helper'

class Teacher::CoursesControllerTest < ActionController::TestCase
  setup do
    @teacher_course = teacher_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_course" do
    assert_difference('Teacher::Course.count') do
      post :create, :teacher_course => {  }
    end

    assert_redirected_to teacher_course_path(assigns(:teacher_course))
  end

  test "should show teacher_course" do
    get :show, :id => @teacher_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @teacher_course
    assert_response :success
  end

  test "should update teacher_course" do
    put :update, :id => @teacher_course, :teacher_course => {  }
    assert_redirected_to teacher_course_path(assigns(:teacher_course))
  end

  test "should destroy teacher_course" do
    assert_difference('Teacher::Course.count', -1) do
      delete :destroy, :id => @teacher_course
    end

    assert_redirected_to teacher_courses_path
  end
end
