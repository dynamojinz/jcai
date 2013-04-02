# -*- encoding : utf-8 -*-
class Admin::CoursesController < ApplicationController
	layout 'admin'
  before_filter :get_admin
  #before_filter :get_admin
  # GET /admin/courses
  # GET /admin/courses.json
  def index
    @courses = Course.order(:name).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => Course.all }
    end
  end

  # GET /admin/courses/1
  # GET /admin/courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @course }
    end
  end

  # GET /admin/courses/new
  # GET /admin/courses/new.json
  def new
    @course =Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @course }
    end
  end

  # GET /admin/courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /admin/courses
  # POST /admin/courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to [:admin, @course], :notice => 'Course was successfully created.' }
        format.json { render :json => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/courses/1
  # PUT /admin/courses/1.json
  def update
    @course = Admin::Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to [:admin, @course], :notice => 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/courses/1
  # DELETE /admin/courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to admin_courses_url }
      format.json { head :no_content }
    end
  end

  # GET /admin/courses/1/students
  # GET /admin/courses/1/students.json
  def students
    @course = Course.find(params[:id])
		@students = @course.students
		@other_students = Student.find(:all, :conditions => ["id not in (select student_id from courses_students where course_id=?)", @course.id])

    respond_to do |format|
      format.html # students.html.erb
      format.json { render :json => @students }
    end
  end

  # POST /admin/courses/1/remove_students
  # POST /admin/courses/1/remove_students.json
  def remove_students
    @course = Course.find(params[:id])
    to_remove = params[:to_be_removed]
    if to_remove
      to_remove.each do |stu_id, do_it|
        if do_it == "yes"
          student = Student.find(stu_id)
          @course.students.delete(student)
          @course.save
        end
      end
    end
    redirect_to students_admin_course_path(@course)
  end

  # POST /admin/courses/1/add_students
  # POST /admin/courses/1/add_students.json
  def add_students
    @course = Course.find(params[:id])
    to_add = params[:to_be_added]
    if to_add
			not_added = []
      to_add.each do |stu_id, do_it|
        if do_it == "yes"
          student = Student.find(stu_id)
					if not @course.add_student(student)
						 not_added << student.name
					end
        end
      end
    end
		if not not_added.empty?
			flash[:notice] = "Students has already joined this course:" + not_added.join(",")
		end
		redirect_to students_admin_course_path(@course)
  end
end
