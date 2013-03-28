class Course < ActiveRecord::Base
  belongs_to :teacher
	has_many :coursewares
	has_many :exams
	has_many :messages
	has_many :notifies
	#FIXME, needs to be changed to has_many :through, as the 
	# relationship become more complicated
  has_and_belongs_to_many :students

  attr_accessible :arrangement, :description, :name, :teacher_id

  validates_presence_of :name, :description, :teacher_id

	validates :teacher_id, :numericality => {:greater_than => 0}

end
