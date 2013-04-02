require 'test_helper'

class Teacher::RecordsControllerTest < ActionController::TestCase
  setup do
    @teacher_record = teacher_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_record" do
    assert_difference('Teacher::Record.count') do
      post :create, teacher_record: {  }
    end

    assert_redirected_to teacher_record_path(assigns(:teacher_record))
  end

  test "should show teacher_record" do
    get :show, id: @teacher_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_record
    assert_response :success
  end

  test "should update teacher_record" do
    put :update, id: @teacher_record, teacher_record: {  }
    assert_redirected_to teacher_record_path(assigns(:teacher_record))
  end

  test "should destroy teacher_record" do
    assert_difference('Teacher::Record.count', -1) do
      delete :destroy, id: @teacher_record
    end

    assert_redirected_to teacher_records_path
  end
end
