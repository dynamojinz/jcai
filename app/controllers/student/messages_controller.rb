class Student::MessagesController < ApplicationController
  layout 'student'
  before_filter :get_student_and_course
  # GET /student/courses/1/messages
  # GET /student/courses/1/messages.json
  def index
    @messages = Message.where(:course_id => @course.id).order('created_at DESC').page(params[:page]).per(10)
    @message = Message.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @course.messages }
    end
  end

  # GET /student/courses/1/messages/1
  # GET /student/courses/1/messages/1.json
  def show
    @message = @course.messages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @message }
    end
  end

  # GET /student/courses/1/messages/new
  # GET /student/courses/1/messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @message }
    end
  end

  # GET /student/courses/1/messages/1/edit
  def edit
    @message = @course.messages.find(params[:id])
  end

  # POST /student/courses/1/messages
  # POST /student/courses/1/messages.json
  def create
    @message = Message.new(params[:message])
    @message.student = @student
    @course.messages << @message

    respond_to do |format|
      if @message.save
        format.html { redirect_to [:student, @course, @message], :notice => 'Message was successfully created.' }
        format.json { render :json => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student/courses/1/messages/1
  # PUT /student/courses/1/messages/1.json
  def update
    @message = @course.messages.find(params[:id])
		check_author

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to [:student, @course, @message], :notice => 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student/courses/1/messages/1
  # DELETE /student/courses/1/messages/1.json
  def destroy
    @message = @course.messages.find(params[:id])
		check_author
    @message.destroy

    respond_to do |format|
      format.html { redirect_to student_course_messages_url(@course) }
      format.json { head :no_content }
    end
  end

  private
  def check_author
    unless @message.student == @student
      flash[:notice]="Wrong operation!"
      redirect_to :controller => 'login', :action => 'login'
      return false
    end
  end
end
