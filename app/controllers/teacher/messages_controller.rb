class Teacher::MessagesController < ApplicationController
  layout 'teacher'
	before_filter :get_teacher_and_course
  # GET /teacher/messages
  # GET /teacher/messages.json
  def index
		@messages = Message.where(:course_id => @course.id).order('created_at').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @course.messages }
    end
  end

  # GET /teacher/messages/1
  # GET /teacher/messages/1.json
  def show
    @message = @course.messages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @message }
    end
  end

  # GET /teacher/messages/new
  # GET /teacher/messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @message }
    end
  end

  # GET /teacher/messages/1/edit
  def edit
    @message = @course.messages.find(params[:id])
  end

  # POST /teacher/messages
  # POST /teacher/messages.json
  def create
    @message = Message.new(params[:message])
		@course.messages << @message

    respond_to do |format|
      if @message.save
        format.html { redirect_to [:teacher, @course, @message], :notice => 'Message was successfully created.' }
        format.json { render :json => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teacher/messages/1
  # PUT /teacher/messages/1.json
  def update
    @message = @course.messages.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to [:teacher, @course, @message], :notice => 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher/messages/1
  # DELETE /teacher/messages/1.json
  def destroy
    @message = @course.messages.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to teacher_course_messages_url(@course) }
      format.json { head :no_content }
    end
  end
end
