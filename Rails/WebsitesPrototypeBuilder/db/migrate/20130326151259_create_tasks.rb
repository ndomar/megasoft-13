class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :page
      t.references :task_result
      t.references :invitation
      t.references :designer

      t.timestamps
    end
    add_index :tasks, :page_id
    add_index :tasks, :task_result_id
    add_index :tasks, :invitation_id
    add_index :tasks, :designer_id
  end
end
