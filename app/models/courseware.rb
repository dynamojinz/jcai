class Courseware < ActiveRecord::Base
	belongs_to :course
  attr_accessible :content_type, :course, :description, :downloaded, :file_data, :file_name, :file_size, :courseware
  validates_presence_of :file_name, :message => "cann't be blank--must select a file"
  def courseware=(courseware_field)
    unless courseware_field == ""
      self.file_name = File.basename(courseware_field.original_filename)
      self.content_type = courseware_field.content_type.chomp
      self.file_data = courseware_field.read
      self.file_size = self.file_data.length
      self.downloaded = 0
    end
  end

  protected
  def validate
    errors.add(:file_size, "should less than 300KB") unless self.file_size.nil? || self.file_size <= 300*1024
  end
end
