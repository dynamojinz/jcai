# -*- encoding : utf-8 -*-
class Teacher::CoursewaresController < ApplicationController
  layout 'teacher'
	before_filter :get_teacher_and_course
  # GET /teacher/coursewares
  # GET /teacher/coursewares.json
  def index
    @coursewares = Courseware.where(:course_id => @course.id).order('created_at').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @course.coursewares }
    end
  end

  # GET /teacher/coursewares/1
  # GET /teacher/coursewares/1.json
  def show
    @courseware = @course.coursewares.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @courseware }
    end
  end

  # GET /teacher/coursewares/new
  # GET /teacher/coursewares/new.json
  def new
    @courseware = Courseware.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @courseware }
    end
  end

  # GET /teacher/coursewares/1/edit
  def edit
    @courseware = @course.coursewares.find(params[:id])
  end

  # POST /teacher/coursewares
  # POST /teacher/coursewares.json
  def create
    @courseware = Courseware.new(params[:courseware])
		@course.coursewares << @courseware

    respond_to do |format|
      if @courseware.save
        format.html { redirect_to [:teacher, @course, @courseware], :notice => 'Courseware was successfully created.' }
        format.json { render :json => @courseware, :status => :created, :location => @courseware }
      else
        format.html { render :action => "new" }
        format.json { render :json => @courseware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teacher/coursewares/1
  # PUT /teacher/coursewares/1.json
  def update
    @courseware = @course.coursewares.find(params[:id])

    respond_to do |format|
      if @courseware.update_attributes(params[:courseware])
        format.html { redirect_to [:teacher, @course, @courseware], :notice => 'Courseware was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @courseware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher/coursewares/1
  # DELETE /teacher/coursewares/1.json
  def destroy
    @courseware = @course.coursewares.find(params[:id])
    @courseware.destroy

    respond_to do |format|
      format.html { redirect_to teacher_course_coursewares_url(@course) }
      format.json { head :no_content }
    end
  end

  # GET /teacher/coursewares/1/download
  def download
    @courseware = @course.coursewares.find(params[:id])
		@courseware.downloaded += 1
		@courseware.save()
    user_agent = request.user_agent.downcase
    send_data(@courseware.file_data,
							:filename => user_agent.include?("msie") ? CGI::escape( @courseware.file_name ) :@courseware.file_name ,
							:type => @courseware.content_type,
							:disposition => "attachment")
  end
end
