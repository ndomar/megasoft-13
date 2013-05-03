class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :action
      t.string :time
      t.string :component_involved
      t.references :task_result

      t.timestamps
    end
    add_index :logs, :task_result_id
  end
end
