require 'test_helper'

class Student::MessagesControllerTest < ActionController::TestCase
  setup do
    @student_message = student_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_message" do
    assert_difference('Student::Message.count') do
      post :create, :student_message => {  }
    end

    assert_redirected_to student_message_path(assigns(:student_message))
  end

  test "should show student_message" do
    get :show, :id => @student_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @student_message
    assert_response :success
  end

  test "should update student_message" do
    put :update, :id => @student_message, :student_message => {  }
    assert_redirected_to student_message_path(assigns(:student_message))
  end

  test "should destroy student_message" do
    assert_difference('Student::Message.count', -1) do
      delete :destroy, :id => @student_message
    end

    assert_redirected_to student_messages_path
  end
end
