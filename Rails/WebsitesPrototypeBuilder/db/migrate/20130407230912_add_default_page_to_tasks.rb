class AddDefaultPageToTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :page_id, :integer, :default => '1'
  end
end
