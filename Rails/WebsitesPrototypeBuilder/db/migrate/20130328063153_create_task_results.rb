class CreateTaskResults < ActiveRecord::Migration
  def change
    create_table :task_results do |t|
      t.boolean :success
      t.integer :timeframe

      t.timestamps
    end
  end
end
