require 'test_helper'

class Student::NotifiesControllerTest < ActionController::TestCase
  setup do
    @student_notify = student_notifies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_notifies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_notify" do
    assert_difference('Student::Notify.count') do
      post :create, :student_notify => {  }
    end

    assert_redirected_to student_notify_path(assigns(:student_notify))
  end

  test "should show student_notify" do
    get :show, :id => @student_notify
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @student_notify
    assert_response :success
  end

  test "should update student_notify" do
    put :update, :id => @student_notify, :student_notify => {  }
    assert_redirected_to student_notify_path(assigns(:student_notify))
  end

  test "should destroy student_notify" do
    assert_difference('Student::Notify.count', -1) do
      delete :destroy, :id => @student_notify
    end

    assert_redirected_to student_notifies_path
  end
end
