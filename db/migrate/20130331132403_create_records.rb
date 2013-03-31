class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :score
      t.references :exam
      t.references :student

      t.timestamps
    end
    add_index :records, :exam_id
    add_index :records, :student_id
  end
end
