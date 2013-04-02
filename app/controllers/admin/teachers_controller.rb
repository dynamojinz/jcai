# -*- encoding : utf-8 -*-
class Admin::TeachersController < ApplicationController
	layout 'admin'
  before_filter :get_admin
  # GET /admin/teachers
  # GET /admin/teachers.json
  def index
    @teachers = Teacher.order(:tea_no).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teachers }
    end
  end

  # GET /admin/teachers/1
  # GET /admin/teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @teacher }
    end
  end

  # GET /admin/teachers/new
  # GET /admin/teachers/new.json
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @teacher }
    end
  end

  # GET /admin/teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
  end

  # POST /admin/teachers
  # POST /admin/teachers.json
  def create
    @teacher = Teacher.new(params[:teacher])

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to [:admin, @teacher], :notice => 'Teacher was successfully created.' }
        format.json { render :json => @teacher, :status => :created, :location => @teacher }
      else
        format.html { render :action => "new" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/teachers/1
  # PUT /admin/teachers/1.json
  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to [:admin, @teacher], :notice => 'Teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/teachers/1
  # DELETE /admin/teachers/1.json
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to admin_teachers_url }
      format.json { head :no_content }
    end
  end
end
