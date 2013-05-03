class AddColumnElementIdToLog < ActiveRecord::Migration
  def change
    add_column :logs, :element_id, :int
  end
end
