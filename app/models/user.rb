# -*- encoding : utf-8 -*-
class User
  attr_accessor  :name, :password, :type, :id, :origin_password, :new_password, :new_password_copy
  
  def initialize(args = nil)
    if args
      self.name = args[:name]
      self.password = args[:password]
      self.type = args[:type]
      self.id = args[:id]
      self.origin_password = args[:origin_password]
      self.new_password = args[:new_password]
      self.new_password_copy = args[:new_password_copy]
    end
  end
  
  def try_to_login
    case self.type
      when 't' then Teacher.find_by_tea_no_and_hashed_password(name, User.hash_password(password))
      when 's' then Student.find_by_stu_no_and_hashed_password(name, User.hash_password(password))
      when 'a' then Admin.find_by_name_and_hashed_password(name, User.hash_password(password))
      else nil
    end
  end
  
  def change_password()
    user = case self.type
      when 't' then Teacher.find_by_id_and_hashed_password(self.id, User.hash_password(self.origin_password))
      when 's' then Student.find_by_id_and_hashed_password(self.id, User.hash_password(self.origin_password))
      when 'a' then Admin.find_by_id_and_hashed_password(self.id, User.hash_password(self.origin_password))
      else nil
    end
    if user
      user.hashed_password = User.hash_password(self.new_password)
      user.save
    end
    user
  end

  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end
end
