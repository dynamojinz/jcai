class Course < ActiveRecord::Base
  belongs_to :teacher
  attr_accessible :arrangement, :description, :name
end
