class AddAnswerStringToRecord < ActiveRecord::Migration
  def change
    add_column :records, :answer_string, :text
  end
end
