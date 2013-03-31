class Teacher::QuestionsController < ApplicationController
  layout 'teacher'
  before_filter :get_teacher_and_course, :get_exam
  # GET /teacher/courses/1/exams/1/questions
  # GET /teacher/courses/1/exams/1/questions.json
  def index
    @questions = Question.where(:exam_id => @exam.id).order(:position).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /teacher/courses/1/exams/1/questions/1
  # GET /teacher/courses/1/exams/1/questions/1.json
  def show
    @question = @exam.questions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /teacher/courses/1/exams/1/questions/new
  # GET /teacher/courses/1/exams/1/questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /teacher/courses/1/exams/1/questions/1/edit
  def edit
    @question = @exam.questions.find(params[:id])
  end

  # POST /teacher/courses/1/exams/1/questions
  # POST /teacher/courses/1/exams/1/questions.json
  def create
    @question = Question.new(params[:question])
		@exam.questions << @question

    respond_to do |format|
      if @question.save
        format.html { redirect_to [:teacher, @course, @exam, @question], notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teacher/courses/1/exams/1/questions/1
  # PUT /teacher/courses/1/exams/1/questions/1.json
  def update
    @question = @exam.questions.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to [:teacher, @course, @exam, @question], notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher/courses/1/exams/1/questions/1
  # DELETE /teacher/courses/1/exams/1/questions/1.json
  def destroy
    @question = @exam.questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to teacher_course_exam_questions_url(@course, @exam) }
      format.json { head :no_content }
    end
  end

	# GET /teacher/course/1/exams/1/questions/1/question
  def question
    @question = @exam.questions.find(params[:id])
    send_data(@question.question_img, :type => @question.question_content_type, :disposition => "inline")
  end
  
	# GET /teacher/course/1/exams/1/questions/1/choices
  def choices
    @question = @exam.questions.find(params[:id])
    send_data(@question.choices_img, :type => @question.choices_content_type, :disposition => "inline")
  end
  
	# POST /teacher/course/1/exams/1/questions/1/move_up
  def move_up
    @question = @exam.questions.find(params[:id])
    @question.move_higher
    redirect_to teacher_course_exam_questions_path(@course, @exam)
 end
  
	# POST /teacher/course/1/exams/1/questions/1/move_down
  def move_down
    @question = @exam.questions.find(params[:id])
    @question.move_lower
    redirect_to teacher_course_exam_questions_path(@course, @exam)
  end
end
