class Notice < ActiveRecord::Base
  attr_accessible :content, :published_at, :title

  validates_presence_of :title, :content
end
