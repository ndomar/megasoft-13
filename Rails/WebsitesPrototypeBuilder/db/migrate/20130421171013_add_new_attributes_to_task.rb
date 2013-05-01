class AddNewAttributesToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :requires_reviewer_info, :boolean
    add_column :tasks, :time_limit, :integer
  end
end
