class CreateTaskResults < ActiveRecord::Migration
  def change
    create_table :task_results do |t|
      t.time :time
      t.float :success
      t.integer :clicks
      t.references :reviewer
      t.references :task

      t.timestamps
    end
    add_index :task_results, :reviewer_id
    add_index :task_results, :task_id
  end
end
