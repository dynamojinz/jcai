class Notify < ActiveRecord::Base
  belongs_to :course
  attr_accessible :content, :readed_times, :title
end
