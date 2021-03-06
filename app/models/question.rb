class Question < ActiveRecord::Base
  belongs_to :exam
	acts_as_list :scope => :exam
  attr_accessible :answer,:question, :choices, :position, :unit_score
	validates :question_img, :length => {:maximum => 100*1024, :too_long => "should less than 100KB"}
	validates :choices_img, :length => {:maximum => 100*1024, :too_long => "should less than 100KB"}
  validates_presence_of :answer, :unit_score, :question_img, :choices_img
  validates_format_of :question_content_type, :with => /^image/, :message => "must be image/*"
  validates_format_of :choices_content_type, :with => /^image/, :message => "must be image/*"
  validates_numericality_of :unit_score, :only_integer => true, :message => "must be an integer"
  validates_inclusion_of :unit_score, :in => 0..100, :message => "must between 0 and 100"

  def question=(question_field)
    unless question_field == ""
      self.question_content_type = question_field.content_type.chomp
      self.question_img = question_field.read
    end
  end
  
  def choices=(choices_field)
    unless choices_field == ""
      self.choices_content_type = choices_field.content_type.chomp
      self.choices_img = choices_field.read
    end
  end
end
