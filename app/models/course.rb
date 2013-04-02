# -*- encoding : utf-8 -*-
class Course < ActiveRecord::Base
  belongs_to :teacher
	has_many :coursewares, :order => 'created_at desc'
	has_many :exams, :order => 'created_at desc'
	has_many :messages, :order => 'created_at desc'
	has_many :notifies, :order => 'created_at desc'
	has_many :courses_students
	has_many :students, :through => :courses_students

  attr_accessible :arrangement, :description, :name, :teacher_id

  validates_presence_of :name, :description, :teacher_id

	validates :teacher_id, :numericality => {:greater_than => 0}

	def add_student(student)
		if CoursesStudent.where(:student_id => student.id, :course_id => self.id).empty?
			self.students << student
			return true
		else
			return false
		end
	end
end
