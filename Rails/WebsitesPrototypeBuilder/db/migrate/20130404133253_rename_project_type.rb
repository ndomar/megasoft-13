class RenameProjectType < ActiveRecord::Migration
  change_table :projects do |t|
  t.remove :type
  t.string :project_type
end
end
