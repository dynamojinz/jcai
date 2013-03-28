require 'test_helper'

class Teacher::NotifiesControllerTest < ActionController::TestCase
  setup do
    @teacher_notify = teacher_notifies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_notifies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_notify" do
    assert_difference('Teacher::Notify.count') do
      post :create, :teacher_notify => {  }
    end

    assert_redirected_to teacher_notify_path(assigns(:teacher_notify))
  end

  test "should show teacher_notify" do
    get :show, :id => @teacher_notify
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @teacher_notify
    assert_response :success
  end

  test "should update teacher_notify" do
    put :update, :id => @teacher_notify, :teacher_notify => {  }
    assert_redirected_to teacher_notify_path(assigns(:teacher_notify))
  end

  test "should destroy teacher_notify" do
    assert_difference('Teacher::Notify.count', -1) do
      delete :destroy, :id => @teacher_notify
    end

    assert_redirected_to teacher_notifies_path
  end
end
