# -*- encoding : utf-8 -*-
#!/bin/env ruby
# encoding: utf-8
class LoginController < ApplicationController
  def welcome
	@notices = Notice.find(:all, :order => "updated_at desc")
  end

  def login
    if request.get?
      @user = User.new
      @user.type = 's'
    else
      @user = User.new(params[:user])
      if @user.name.empty? or @user.password.empty? or @user.type.empty?
        flash[:notice] = "请输入用户名和密码！"
      else
        if user = @user.try_to_login
          session[:user_id] = user.id
          session[:user_type] = @user.type
          case @user.type
            when 't'
              redirect_to :controller => 'teacher/courses', :action => 'index'
            when 's'
              redirect_to :controller => 'student/course', :action => 'index'
            when 'a'
							#redirect_to :controller => 'course_admin', :action => 'list'
							redirect_to admin_courses_path
          end
        else
          flash[:notice] = "用户名或密码输错了！"
          @user.password = nil
        end
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_type] = nil
    flash[:notice] = "成功退出！"
    redirect_to :action => 'login'
  end

  def notice
    @notice = Notice.find(params[:id])
  end

  def change_password
  end
end
