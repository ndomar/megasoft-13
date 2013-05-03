class ChangeColumnTypeInTaskResultTable < ActiveRecord::Migration
  def up
    change_column :task_results, :time, :string
  end

  def down
    change_column :task_results, :time, :int
  end
end
