# -*- encoding : utf-8 -*-
require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get notice" do
    get :notice
    assert_response :success
  end

  test "should get change_password" do
    get :change_password
    assert_response :success
  end

end
