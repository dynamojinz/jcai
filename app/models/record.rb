class Record < ActiveRecord::Base
  belongs_to :exam
  belongs_to :student
  attr_accessible :ended_at, :score, :started_at
  def minute_spaned
    ((self.ended_at - self.started_at)/60).to_i
  end
end
