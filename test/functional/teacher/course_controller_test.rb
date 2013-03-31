# -*- encoding : utf-8 -*-
require 'test_helper'

class Teacher::CourseControllerTest < ActionController::TestCase
  test "should get course" do
    get :course
    assert_response :success
  end

  test "should get arragement" do
    get :arragement
    assert_response :success
  end

  test "should get students" do
    get :students
    assert_response :success
  end

end
