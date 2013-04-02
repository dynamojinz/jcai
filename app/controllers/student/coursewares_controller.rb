class Student::CoursewaresController < ApplicationController
  layout 'student'
  before_filter :get_student_and_course
  # GET /student/courses/1/coursewares
  # GET /student/courses/1/coursewares.json
  def index
    @coursewares = Courseware.where(:course_id => @course.id).order('created_at DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @course.coursewares }
    end
  end

  # GET /student/courses/1/coursewares/1
  # GET /student/courses/1/coursewares/1.json
  def show
    @courseware = @course.coursewares.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @courseware }
    end
  end

	# GET /student/courses/1/courseware/1/download
  def download
    @courseware = @course.coursewares.find(params[:id])
    user_agent = request.user_agent.downcase
    send_data(@courseware.file_data,
                    :filename => user_agent.include?("msie") ? CGI::escape( @courseware.file_name ) :@courseware.file_name ,
                    :type => @courseware.content_type,
                    :disposition => "attachment")
    @courseware.downloaded += 1
    @courseware.save
  end
end
