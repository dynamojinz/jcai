# -*- encoding : utf-8 -*-
class Admin::StudentsController < ApplicationController
	layout 'admin'
  before_filter :get_admin
  # GET /admin/students
  # GET /admin/students.json
  def index
    @students = Student.order(:stu_no).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @students }
    end
  end

  # GET /admin/students/1
  # GET /admin/students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /admin/students/new
  # GET /admin/students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /admin/students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /admin/students
  # POST /admin/students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to [:admin, @student], :notice => 'Student was successfully created.' }
        format.json { render :json => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/students/1
  # PUT /admin/students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to [:admin, @student], :notice => 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/students/1
  # DELETE /admin/students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to admin_students_url }
      format.json { head :no_content }
    end
  end
end
