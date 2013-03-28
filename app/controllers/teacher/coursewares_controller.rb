class Teacher::CoursewaresController < ApplicationController
  layout 'teacher'
	before_filter :get_teacher_and_courses
  # GET /teacher/coursewares
  # GET /teacher/coursewares.json
  def index
    @teacher_coursewares = Teacher::Courseware.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teacher_coursewares }
    end
  end

  # GET /teacher/coursewares/1
  # GET /teacher/coursewares/1.json
  def show
    @teacher_courseware = Teacher::Courseware.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @teacher_courseware }
    end
  end

  # GET /teacher/coursewares/new
  # GET /teacher/coursewares/new.json
  def new
    @teacher_courseware = Teacher::Courseware.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @teacher_courseware }
    end
  end

  # GET /teacher/coursewares/1/edit
  def edit
    @teacher_courseware = Teacher::Courseware.find(params[:id])
  end

  # POST /teacher/coursewares
  # POST /teacher/coursewares.json
  def create
    @teacher_courseware = Teacher::Courseware.new(params[:courseware])

    respond_to do |format|
      if @teacher_courseware.save
        format.html { redirect_to @teacher_courseware, :notice => 'Courseware was successfully created.' }
        format.json { render :json => @teacher_courseware, :status => :created, :location => @teacher_courseware }
      else
        format.html { render :action => "new" }
        format.json { render :json => @teacher_courseware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teacher/coursewares/1
  # PUT /teacher/coursewares/1.json
  def update
    @teacher_courseware = Teacher::Courseware.find(params[:id])

    respond_to do |format|
      if @teacher_courseware.update_attributes(params[:courseware])
        format.html { redirect_to @teacher_courseware, :notice => 'Courseware was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teacher_courseware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher/coursewares/1
  # DELETE /teacher/coursewares/1.json
  def destroy
    @teacher_courseware = Teacher::Courseware.find(params[:id])
    @teacher_courseware.destroy

    respond_to do |format|
      format.html { redirect_to teacher_coursewares_url }
      format.json { head :no_content }
    end
  end
end
