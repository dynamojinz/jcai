class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :question
      t.text :reply
      t.datetime :replied_at
      t.references :student
      t.references :course

      t.timestamps
    end
    add_index :messages, :student_id
    add_index :messages, :course_id
  end
end
