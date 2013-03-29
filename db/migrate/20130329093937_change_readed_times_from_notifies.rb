class ChangeReadedTimesFromNotifies < ActiveRecord::Migration
  def up
		change_column :notifies, :readed_times, :integer, :default => 0
  end

  def down
		change_column :notifies, :readed_times, :integer, :default => :null;
  end
end
