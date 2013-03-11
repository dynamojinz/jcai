class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :stu_no
      t.string :name
      t.string :hashed_password

      t.timestamps
    end
  end
end
