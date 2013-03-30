class RenameDatabaseColumn < ActiveRecord::Migration
  def up
  	rename_column :designers, :username, :designer_name
  end

  def down
  	rename_column :designers, :designer_name, :username
  end
end
