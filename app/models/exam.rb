# -*- encoding : utf-8 -*-
class Exam < ActiveRecord::Base
  belongs_to :course
	has_many :questions, :order => :position
	has_many :records, :order => 'ended_at DESC'
  attr_accessible :description, :name, :time_limit
  validates_presence_of :name, :time_limit
  validates_numericality_of :time_limit, :only_integer => true, :message => "must be an integer"
  validates_inclusion_of :time_limit, :in => 0..180, :message => "must between 0 and 180 minutes"

  def total_score
    self.questions.inject(0){ |sum, q |sum + q.unit_score }
  end
end
