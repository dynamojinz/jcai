class Student::ExamsController < ApplicationController
  layout 'student'
  before_filter :get_student_and_course
  # GET /student/courses/1/exams
  # GET /student/courses/1/exams.json
  def index
    @exams = Exam.where(:course_id => @course.id).order('created_at DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @exams }
    end
  end

  # GET /student/courses/1/exams/1
  # GET /student/courses/1/exams/1.json
  def show
    @exam = @course.exams.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @exam }
    end
  end

	# GET /student/courses/1/exams/1/start
	# GET /student/courses/1/exams/1/start.json
  def start
    @exam = @course.exams.find(params[:id])
    session[:test_started_at] = Time.now unless session[:test_started_at]
    respond_to do |format|
			format.html { render :layout => false }
			format.json { head :no_content }
		end
  end
  
	# POST /student/courses/1/exams/1/check
	# POST /student/courses/1/exams/1/check.json
  def check
    @exam = @course.exams.find(params[:id])
    @record = Record.new
    @record.exam, @record.student = @exam, @student
    @record.started_at = session[:test_started_at] || Time.now
    session[:test_started_at] = nil
    @record.ended_at, @record.score, answers = Time.now, 0, [] 
    @results = Array.new(@exam.questions.size)
    if question_answer = params[:question_answer]
      question_answer.each do |question_id, answer|
        if question = @exam.questions.find(question_id.to_i)
        answers << "#{question.id}#{answer}"
          if question and question.answer == answer
            @record.score += question.unit_score
            @results[question.position-1] = "#{question.position}:#{question.answer} --正确"
          else
            @results[question.position-1] = "#{question.position}:#{answer} --错误，正确答案为#{question.answer}"
          end
        end
      end
    end
    @results.each_index{|i| @results[i] = @results[i] || "#{i+1}:未选" }
    @record.answer_string = answers.join("-")
    @record.save
    respond_to do |format|
			format.html { render :layout => false }
			format.json { head :no_content }
		end
  end
end
