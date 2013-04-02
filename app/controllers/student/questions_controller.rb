class Student::QuestionsController < ApplicationController
  layout 'student'
  before_filter :get_student_and_course, :get_exam

	# GET /student/courses/1/exams/1/questions/1/question
  def question
		@question = @exam.questions.find(params[:id])
    send_data(@question.question_img, :type => @question.question_content_type, :disposition => "inline")
  end
  
	# GET /student/courses/1/exams/1/questions/1/choices
  def choices
		@question = @exam.questions.find(params[:id])
    send_data(@question.choices_img, :type => @question.choices_content_type, :disposition => "inline")
  end
end
