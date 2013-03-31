# -*- encoding : utf-8 -*-
class CreateNotifies < ActiveRecord::Migration
  def change
    create_table :notifies do |t|
      t.string :title
      t.text :content
      t.integer :readed_times
      t.references :course

      t.timestamps
    end
    add_index :notifies, :course_id
  end
end
