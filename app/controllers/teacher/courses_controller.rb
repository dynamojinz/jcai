# -*- encoding : utf-8 -*-
class Teacher::CoursesController < ApplicationController
  layout 'teacher'
	# get default @courses = @teacher.courses
	before_filter :get_teacher
  # GET /teacher/courses
  # GET /teacher/courses.json
  def index
		@courses = @teacher.courses
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @courses }
    end
  end

  # GET /teacher/courses/1
  # GET /teacher/courses/1.json
  def show
		@course = @teacher.courses.find(params[:id])
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

  # GET /teacher/courses/1/edit
  def edit
		@course = @teacher.courses.find(params[:id])
  end

  # PUT /teacher/courses/1
  # PUT /teacher/courses/1.json
  def update
		@course = @teacher.courses.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to [:teacher, @course], :notice => 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  def arragement
		@course = @teacher.courses.find(params[:id])
    unless request.get?
      if @course.update_attributes(params[:course])
        flash[:notice] = 'Edit arrangement successfully!'
      else
        flash[:notice] = 'Failed to edit arrangement!'
      end
      redirect_to :action => 'course', :id => @course
    end
  end

  def students
		@course = @teacher.courses.find(params[:id])
    @students = @course.students
  end

end
