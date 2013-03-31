# -*- encoding : utf-8 -*-
class Exam < ActiveRecord::Base
  belongs_to :course
  attr_accessible :description, :name, :time_limit
  validates_presence_of :name, :time_limit
  validates_numericality_of :time_limit, :only_integer => true, :message => "must be an integer"
  validates_inclusion_of :time_limit, :in => 0..180, :message => "must between 0 and 180 minutes"
end
