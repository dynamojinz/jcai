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
              redirect_to teacher_courses_path
            when 's'
              redirect_to student_courses_path
            when 'a'
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
    unless session[:user_type] and session[:user_id]
      handle_error("请登录先！")
      return false
    end
    if request.get?
      @user = User.new
    else
      @user = User.new(params[:user])
      @user.id, @user.type = session[:user_id], session[:user_type]
      if @user.new_password != @user.new_password_copy
        flash[:notice] = "两次输入的密码不一致，请重新输入！"
      elsif @user.new_password.empty?
        flash[:notice] = "新密码不能为空！"
      elsif @user.change_password()
        flash[:notice] = "成功修改密码,请重新登录！"
        session[:user_id] = nil
        session[:user_type] = nil
        redirect_to :action => 'login'
      else
        flash[:notice] = "原密码输入错误,请重新输入！"
      end
      @user = User.new
    end
  end
end
