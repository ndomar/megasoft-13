class ChangeElementIdTypeInLog < ActiveRecord::Migration
  def up
    change_column :logs, :element_id, :string
  end

  def down
    change_column :logs, :element_id, :int
  end
end
