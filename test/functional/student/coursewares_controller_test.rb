require 'test_helper'

class Student::CoursewaresControllerTest < ActionController::TestCase
  setup do
    @student_courseware = student_coursewares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_coursewares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_courseware" do
    assert_difference('Student::Courseware.count') do
      post :create, :student_courseware => {  }
    end

    assert_redirected_to student_courseware_path(assigns(:student_courseware))
  end

  test "should show student_courseware" do
    get :show, :id => @student_courseware
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @student_courseware
    assert_response :success
  end

  test "should update student_courseware" do
    put :update, :id => @student_courseware, :student_courseware => {  }
    assert_redirected_to student_courseware_path(assigns(:student_courseware))
  end

  test "should destroy student_courseware" do
    assert_difference('Student::Courseware.count', -1) do
      delete :destroy, :id => @student_courseware
    end

    assert_redirected_to student_coursewares_path
  end
end
