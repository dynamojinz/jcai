class Teacher::NotifiesController < ApplicationController
  layout 'teacher'
	before_filter :get_teacher_and_courses
  # GET /teacher/notifies
  # GET /teacher/notifies.json
  def index
    @teacher_notifies = Teacher::Notify.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teacher_notifies }
    end
  end

  # GET /teacher/notifies/1
  # GET /teacher/notifies/1.json
  def show
    @teacher_notify = Teacher::Notify.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @teacher_notify }
    end
  end

  # GET /teacher/notifies/new
  # GET /teacher/notifies/new.json
  def new
    @teacher_notify = Teacher::Notify.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @teacher_notify }
    end
  end

  # GET /teacher/notifies/1/edit
  def edit
    @teacher_notify = Teacher::Notify.find(params[:id])
  end

  # POST /teacher/notifies
  # POST /teacher/notifies.json
  def create
    @teacher_notify = Teacher::Notify.new(params[:teacher_notify])

    respond_to do |format|
      if @teacher_notify.save
        format.html { redirect_to @teacher_notify, :notice => 'Notify was successfully created.' }
        format.json { render :json => @teacher_notify, :status => :created, :location => @teacher_notify }
      else
        format.html { render :action => "new" }
        format.json { render :json => @teacher_notify.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teacher/notifies/1
  # PUT /teacher/notifies/1.json
  def update
    @teacher_notify = Teacher::Notify.find(params[:id])

    respond_to do |format|
      if @teacher_notify.update_attributes(params[:teacher_notify])
        format.html { redirect_to @teacher_notify, :notice => 'Notify was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teacher_notify.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher/notifies/1
  # DELETE /teacher/notifies/1.json
  def destroy
    @teacher_notify = Teacher::Notify.find(params[:id])
    @teacher_notify.destroy

    respond_to do |format|
      format.html { redirect_to teacher_notifies_url }
      format.json { head :no_content }
    end
  end
end
