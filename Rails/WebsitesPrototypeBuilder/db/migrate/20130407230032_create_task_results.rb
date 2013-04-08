class CreateTaskResults < ActiveRecord::Migration
  def change
    create_table :task_results do |t|
      t.integer :task_id
      t.integer :reviewer_id
      t.integer :clicks
      t.boolean :success
      t.integer :time

      t.timestamps
    end
  end

end
