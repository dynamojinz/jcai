class Student::CoursesController < ApplicationController
  layout 'student'
  before_filter :get_student
  # GET /student/courses
  # GET /student/courses.json
  def index
    @courses = @student.courses

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @courses }
    end
  end

  # GET /student/courses/1
  # GET /student/courses/1.json
  def show
		@course = @student.courses.find(params[:id])
    @notifies = @course.notifies.find(:all,
																		  :order => 'created_at DESC',
																		  :limit => 5)
    @coursewares = @course.coursewares.find(:all,
																						:order => 'created_at DESC',
																						:limit => 5)
    @exams = @course.exams.find(:all,
																:order => 'created_at DESC',
																:limit => 5)
		@messages = @course.messages.find(:all,
																			:order => 'created_at desc',
																			:conditions => "replied_at is null",
																			:limit => 5)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @course }
    end
  end

  def arrangement
		@course = @student.courses.find(params[:id])
  end
end
