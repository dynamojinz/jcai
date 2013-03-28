class Teacher::MessagesController < ApplicationController
  layout 'teacher'
	before_filter :get_teacher_and_courses
  # GET /teacher/messages
  # GET /teacher/messages.json
  def index
    @teacher_messages = Teacher::Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teacher_messages }
    end
  end

  # GET /teacher/messages/1
  # GET /teacher/messages/1.json
  def show
    @teacher_message = Teacher::Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @teacher_message }
    end
  end

  # GET /teacher/messages/new
  # GET /teacher/messages/new.json
  def new
    @teacher_message = Teacher::Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @teacher_message }
    end
  end

  # GET /teacher/messages/1/edit
  def edit
    @teacher_message = Teacher::Message.find(params[:id])
  end

  # POST /teacher/messages
  # POST /teacher/messages.json
  def create
    @teacher_message = Teacher::Message.new(params[:teacher_message])

    respond_to do |format|
      if @teacher_message.save
        format.html { redirect_to @teacher_message, :notice => 'Message was successfully created.' }
        format.json { render :json => @teacher_message, :status => :created, :location => @teacher_message }
      else
        format.html { render :action => "new" }
        format.json { render :json => @teacher_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teacher/messages/1
  # PUT /teacher/messages/1.json
  def update
    @teacher_message = Teacher::Message.find(params[:id])

    respond_to do |format|
      if @teacher_message.update_attributes(params[:teacher_message])
        format.html { redirect_to @teacher_message, :notice => 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teacher_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher/messages/1
  # DELETE /teacher/messages/1.json
  def destroy
    @teacher_message = Teacher::Message.find(params[:id])
    @teacher_message.destroy

    respond_to do |format|
      format.html { redirect_to teacher_messages_url }
      format.json { head :no_content }
    end
  end
end
