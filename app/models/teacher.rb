class Teacher < ActiveRecord::Base
  attr_accessible :hashed_password, :name, :tea_no
	has_many :courses
  
  validates_presence_of :tea_no, :name, :hashed_password
  validates_uniqueness_of :tea_no
  
  def password=(new_password)
    unless new_password.empty?
      self.hashed_password = User.hash_password(new_password)
    end
  end
  def password
    ""
  end
end
