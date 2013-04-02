# -*- encoding : utf-8 -*-
require 'test_helper'

class Teacher::MessagesControllerTest < ActionController::TestCase
  setup do
    @teacher_message = teacher_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_message" do
    assert_difference('Teacher::Message.count') do
      post :create, :teacher_message => {  }
    end

    assert_redirected_to teacher_message_path(assigns(:teacher_message))
  end

  test "should show teacher_message" do
    get :show, :id => @teacher_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @teacher_message
    assert_response :success
  end

  test "should update teacher_message" do
    put :update, :id => @teacher_message, :teacher_message => {  }
    assert_redirected_to teacher_message_path(assigns(:teacher_message))
  end

  test "should destroy teacher_message" do
    assert_difference('Teacher::Message.count', -1) do
      delete :destroy, :id => @teacher_message
    end

    assert_redirected_to teacher_messages_path
  end
end
