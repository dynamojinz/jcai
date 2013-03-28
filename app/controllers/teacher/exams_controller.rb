class Teacher::ExamsController < ApplicationController
  layout 'teacher'
	before_filter :get_teacher_and_courses
  # GET /teacher/exams
  # GET /teacher/exams.json
  def index
    @teacher_exams = Teacher::Exam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teacher_exams }
    end
  end

  # GET /teacher/exams/1
  # GET /teacher/exams/1.json
  def show
    @teacher_exam = Teacher::Exam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @teacher_exam }
    end
  end

  # GET /teacher/exams/new
  # GET /teacher/exams/new.json
  def new
    @teacher_exam = Teacher::Exam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @teacher_exam }
    end
  end

  # GET /teacher/exams/1/edit
  def edit
    @teacher_exam = Teacher::Exam.find(params[:id])
  end

  # POST /teacher/exams
  # POST /teacher/exams.json
  def create
    @teacher_exam = Teacher::Exam.new(params[:teacher_exam])

    respond_to do |format|
      if @teacher_exam.save
        format.html { redirect_to @teacher_exam, :notice => 'Exam was successfully created.' }
        format.json { render :json => @teacher_exam, :status => :created, :location => @teacher_exam }
      else
        format.html { render :action => "new" }
        format.json { render :json => @teacher_exam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teacher/exams/1
  # PUT /teacher/exams/1.json
  def update
    @teacher_exam = Teacher::Exam.find(params[:id])

    respond_to do |format|
      if @teacher_exam.update_attributes(params[:teacher_exam])
        format.html { redirect_to @teacher_exam, :notice => 'Exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teacher_exam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher/exams/1
  # DELETE /teacher/exams/1.json
  def destroy
    @teacher_exam = Teacher::Exam.find(params[:id])
    @teacher_exam.destroy

    respond_to do |format|
      format.html { redirect_to teacher_exams_url }
      format.json { head :no_content }
    end
  end
end
