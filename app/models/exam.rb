class Exam < ActiveRecord::Base
  belongs_to :course
  attr_accessible :description, :name, :time_limit
end
