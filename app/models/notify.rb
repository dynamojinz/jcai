class Notify < ActiveRecord::Base
  belongs_to :course
  attr_accessible :content, :readed_times, :title
  validates_presence_of :title, :content, :course_id
end
