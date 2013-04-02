# -*- encoding : utf-8 -*-
class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :hashed_password

      t.timestamps
    end
  end
end
