class CreateCoursewares < ActiveRecord::Migration
  def change
    create_table :coursewares do |t|
      t.references :course
      t.string :file_name
      t.string :content_type
      t.integer :file_size
      t.binary :file_data
      t.text :description
      t.integer :downloaded

      t.timestamps
    end
		add_index :coursewares, :course_id
  end
end
