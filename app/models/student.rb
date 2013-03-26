class Student < ActiveRecord::Base
  attr_accessible :hashed_password, :name, :stu_no
	#FIXME, needs to be changed to has_many :through, as the 
	# relationship become more complicated
	has_and_belongs_to_many :courses
  
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
