class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.text :arrangement
      t.references :teacher

      t.timestamps
    end
    add_index :courses, :teacher_id
  end
end
