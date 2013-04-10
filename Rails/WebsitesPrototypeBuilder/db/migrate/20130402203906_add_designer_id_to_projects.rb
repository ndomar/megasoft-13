class AddDesignerIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :designer_id, :integer
  end
end
