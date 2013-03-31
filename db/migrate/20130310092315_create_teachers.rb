# -*- encoding : utf-8 -*-
class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :tea_no
      t.string :name
      t.string :hashed_password

      t.timestamps
    end
  end
end
