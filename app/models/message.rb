class Message < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  attr_accessible :question, :replied_at, :reply
end
