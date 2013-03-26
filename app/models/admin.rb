class Admin < ActiveRecord::Base
  attr_accessible :hashed_password, :name
end
