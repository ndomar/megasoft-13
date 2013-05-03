class ChangeDefaultValuePageIdTask < ActiveRecord::Migration
  def change
    change_column :tasks, :page_id, :integer, :default => 0
  end
end
