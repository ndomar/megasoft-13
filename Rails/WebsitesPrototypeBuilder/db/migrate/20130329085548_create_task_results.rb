class CreateTaskResults < ActiveRecord::Migration
  def change
    create_table :task_results do |t|
      t.boolean :success
      t.datetime :time_frame
      t.integer :clicks
      t.references :task

      t.timestamps
    end
  end
end
