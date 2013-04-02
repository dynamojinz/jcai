# -*- encoding : utf-8 -*-
require 'test_helper'

class Teacher::CoursewaresControllerTest < ActionController::TestCase
  setup do
    @teacher_courseware = teacher_coursewares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_coursewares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_courseware" do
    assert_difference('Teacher::Courseware.count') do
      post :create, :teacher_courseware => {  }
    end

    assert_redirected_to teacher_courseware_path(assigns(:teacher_courseware))
  end

  test "should show teacher_courseware" do
    get :show, :id => @teacher_courseware
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @teacher_courseware
    assert_response :success
  end

  test "should update teacher_courseware" do
    put :update, :id => @teacher_courseware, :teacher_courseware => {  }
    assert_redirected_to teacher_courseware_path(assigns(:teacher_courseware))
  end

  test "should destroy teacher_courseware" do
    assert_difference('Teacher::Courseware.count', -1) do
      delete :destroy, :id => @teacher_courseware
    end

    assert_redirected_to teacher_coursewares_path
  end
end
