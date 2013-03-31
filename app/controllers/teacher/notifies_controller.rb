# -*- encoding : utf-8 -*-
class Teacher::NotifiesController < ApplicationController
  layout 'teacher'
	before_filter :get_teacher_and_course
  # GET /teacher/notifies
  # GET /teacher/notifies.json
  def index
    @teacher_notifies = Notify.where(:course_id => @course.id).order('created_at desc')
		@notifies = @teacher_notifies.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teacher_notifies }
    end
  end

  # GET /teacher/notifies/1
  # GET /teacher/notifies/1.json
  def show
    @notify = @course.notifies.find(params[:id])
		@notify.readed_times += 1
		@notify.save()

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notify }
    end
  end

  # GET /teacher/notifies/new
  # GET /teacher/notifies/new.json
  def new
    @notify = Notify.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @notify }
    end
  end

  # GET /teacher/notifies/1/edit
  def edit
    @notify = @course.notifies.find(params[:id])
  end

  # POST /teacher/notifies
  # POST /teacher/notifies.json
  def create
    @notify = Notify.new(params[:notify])
    @course.notifies << @notify

    respond_to do |format|
      if @notify.save
        format.html { redirect_to [:teacher, @course,  @notify], :notice => 'Notify was successfully created.' }
        format.json { render :json => @notify, :status => :created, :location => @notify }
      else
        format.html { render :action => "new" }
        format.json { render :json => @notify.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teacher/notifies/1
  # PUT /teacher/notifies/1.json
  def update
    @notify = @course.notifies.find(params[:id])

    respond_to do |format|
      if @notify.update_attributes(params[:notify])
        format.html { redirect_to [:teacher, @course, @notify], :notice => 'Notify was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @notify.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher/notifies/1
  # DELETE /teacher/notifies/1.json
  def destroy
    @notify = @course.notifies.find(params[:id])
    @notify.destroy

    respond_to do |format|
      format.html { redirect_to teacher_course_notifies_url(@course) }
      format.json { head :no_content }
    end
  end
end
