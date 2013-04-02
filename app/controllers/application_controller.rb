# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :configure_charsets
  
  #def configure_charsets
    #@response.headers["Content-Type"] = "text/html; charset=utf-8"
  #end
  #-----------------------Error handling ------------------------------------------
  def handle_error(message)
    flash[:notice] = message
    redirect_to :controller => '/login', :action => 'login'
    return false
  end
  #-----------------------Admin Module--------------------------------------
  def get_admin
    if session[:user_type] == 'a' and session[:user_id]
      @admin = Admin.find(session[:user_id])
    else
      handle_error("请登录先！")
      return false
    end
  end  
  #-----------------------Teacher Module------------------------------------
  def get_teacher
    unless @teacher = _get_teacher
      handle_error("请登录先！") 
      return false
    end
  end

  def get_teacher_and_course
    unless @teacher = _get_teacher
      handle_error("请登录先！") 
      return false
    end
    @course = @teacher.courses.find(params[:course_id])
  rescue
    handle_error "参数错误！"
  end
  
  def _get_teacher
    if session[:user_type] == 't' and session[:user_id]
      teacher = Teacher.find(session[:user_id])
    end
  end
  #-------------------------Student Module-----------------------------------
  def get_student
    unless @student = _get_student
      handle_error("请登录先！")
      return false
    end
  end
	
  def get_student_and_course
		get_student
    @course = @student.courses.find(params[:course_id])
  rescue
    handle_error "参数错误！"
  end
  
  def _get_student
    if session[:user_type] == 's' and session[:user_id]
      student = Student.find(session[:user_id])
    end
  end
  
  #--------------------------Course Module------------------------------------
  def get_exam
    @exam = @course.exams.find(params[:exam_id])
  rescue
    handle_error "参数错误！"
  end
  
  
  def get_notify
    @notify = @course.notifies.find(params[:nt_id])
  rescue
    handle_error "参数错误！"
  end
  
  def get_message
    @message = @course.messages.find(params[:ms_id])
  rescue
    handle_error "参数错误！"
  end
  
  def get_courseware
    @courseware = @course.coursewares.find(params[:cw_id])
  rescue
    handle_error "参数错误！"
  end
end
