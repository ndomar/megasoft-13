class RenameColumnType < ActiveRecord::Migration
  def up
    rename_column :projects, :type, :project_type
  end

  def down
  end
end
