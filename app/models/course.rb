class Course < ActiveRecord::Base
  belongs_to :teacher
	#FIXME, needs to be changed to has_many :through, as the 
	# relationship become more complicated
  has_and_belongs_to_many :students

  attr_accessible :arrangement, :description, :name

  validates_presence_of :name, :description, :teacher_id

  def validate
    errors.add(:teacher, "Invalid ID") unless teacher_id>0 
  end
end
