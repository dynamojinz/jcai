# -*- encoding : utf-8 -*-
class Student < ActiveRecord::Base
  attr_accessible :password, :name, :stu_no

	has_many :courses_students
	has_many :courses, :through => :courses_students
  
  validates_presence_of :stu_no, :name, :hashed_password
  validates_uniqueness_of :stu_no
  
  def password=(new_password)
    unless new_password.empty?
      self.hashed_password = User.hash_password(new_password)
    end
  end
  def password
    ""
  end
end
