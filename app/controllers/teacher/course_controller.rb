class Teacher::CourseController < ApplicationController
  layout 'teacher'
	before_filter :get_teacher_and_courses

	def index
	end

  def course
    @notifies = @course.notifies.find(:all,
																		  :order => 'updated_at DESC',
																		  :limit => 5)
    @coursewares = @course.coursewares.find(:all,
																						:order => 'updated_at DESC',
																						:limit => 5)
    @exams = @course.exams.find(:all,
																:order => 'updated_at DESC',
																:limit => 5)
		@messages = @course.messages.find(:all,
																			:order => 'created_at desc',
																			:conditions => "replied_at is null",
																			:limit => 5)
  end

  def arragement
    unless request.get?
      if @course.update_attributes(params[:course])
        flash[:notice] = 'Edit arrangement successfully!'
      else
        flash[:notice] = 'Failed to edit arrangement!'
      end
      redirect_to :action => 'course', :id => @course
    end
  end

  def students
    @students = @course.students
  end
end
