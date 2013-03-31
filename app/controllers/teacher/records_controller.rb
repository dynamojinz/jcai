class Teacher::RecordsController < ApplicationController
  layout 'teacher'
  before_filter :get_teacher_and_course, :get_exam
  # GET /teacher/courses/1/exams/1/records
  # GET /teacher/courses/1/exams/1/records.json
  def index
		@records = Record.where(:exam_id => @exam.id).order('ended_at DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
    end
  end

  # GET /teacher/courses/1/exams/1/records/1
  # GET /teacher/courses/1/exams/1/records/1.json
  def show
    @record = @exam.records.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end

  # DELETE /teacher/courses/1/exams/1/records/1
  # DELETE /teacher/courses/1/exams/1/records/1.json
  def destroy
    @record = @exam.records.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to teacher_course_exam_records_url(@course, @exam) }
      format.json { head :no_content }
    end
  end
end
