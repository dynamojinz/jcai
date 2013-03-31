# -*- encoding : utf-8 -*-
class Teacher::ExamsController < ApplicationController
  layout 'teacher'
	before_filter :get_teacher_and_course
  # GET /teacher/courses/1/exams
  # GET /teacher/courses/1/exams.json
  def index
    @exams = Exam.where(:course_id => @course.id).order('created_at').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @course.exams }
    end
  end

  # GET /teacher/courses/1/exams/1
  # GET /teacher/courses/1/exams/1.json
  def show
    @exam = @course.exams.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @exam }
    end
  end

  # GET /teacher/courses/1/exams/new
  # GET /teacher/courses/1/exams/new.json
  def new
    @exam = Exam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @exam }
    end
  end

  # GET /teacher/courses/1/exams/1/edit
  def edit
    @exam = @course.exams.find(params[:id])
  end

  # POST /teacher/courses/1/exams
  # POST /teacher/courses/1/exams.json
  def create
    @exam = Exam.new(params[:exam])
		@course.exams << @exam

    respond_to do |format|
      if @exam.save
        format.html { redirect_to [:teacher, @course, @exam], :notice => 'Exam was successfully created.' }
        format.json { render :json => @exam, :status => :created, :location => @exam }
      else
        format.html { render :action => "new" }
        format.json { render :json => @exam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teacher/courses/1/exams/1
  # PUT /teacher/courses/1/exams/1.json
  def update
    @exam = @course.exams.find(params[:id])

    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        format.html { redirect_to [:teacher, @course, @exam], :notice => 'Exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @exam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher/courses/1/exams/1
  # DELETE /teacher/courses/1/exams/1.json
  def destroy
    @exam = @course.exams.find(params[:id])
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to teacher_course_exams_url(@course) }
      format.json { head :no_content }
    end
  end
end
