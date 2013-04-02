class Student::NotifiesController < ApplicationController
  layout 'student'
  before_filter :get_student_and_course
  # GET /student/courses/1/notifies
  # GET /student/courses/1/notifies.json
  def index
    @notifies = Notify.where(:course_id => @course.id).order('created_at DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @course.notifies }
    end
  end

  # GET /student/courses/1/notifies/1
  # GET /student/courses/1/notifies/1.json
  def show
    @notify = @course.notifies.find(params[:id])
    @notify.readed_times += 1
    @notify.save

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notify }
    end
  end
end
