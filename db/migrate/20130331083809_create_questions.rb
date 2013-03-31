class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_content_type
      t.binary :question_img
      t.string :choices_content_type
      t.binary :choices_img
      t.string :answer
      t.integer :unit_score
      t.integer :position
      t.references :exam

      t.timestamps
    end
    add_index :questions, :exam_id
  end
end
