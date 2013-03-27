require 'test_helper'

class Admin::NoticesControllerTest < ActionController::TestCase
  setup do
    @admin_notice = admin_notices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_notices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_notice" do
    assert_difference('Admin::Notice.count') do
      post :create, :admin_notice => {  }
    end

    assert_redirected_to admin_notice_path(assigns(:admin_notice))
  end

  test "should show admin_notice" do
    get :show, :id => @admin_notice
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_notice
    assert_response :success
  end

  test "should update admin_notice" do
    put :update, :id => @admin_notice, :admin_notice => {  }
    assert_redirected_to admin_notice_path(assigns(:admin_notice))
  end

  test "should destroy admin_notice" do
    assert_difference('Admin::Notice.count', -1) do
      delete :destroy, :id => @admin_notice
    end

    assert_redirected_to admin_notices_path
  end
end
