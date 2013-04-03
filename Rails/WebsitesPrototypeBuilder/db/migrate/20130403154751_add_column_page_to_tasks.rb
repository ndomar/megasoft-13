class AddColumnPageToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :page_id, :integer
  end
end
