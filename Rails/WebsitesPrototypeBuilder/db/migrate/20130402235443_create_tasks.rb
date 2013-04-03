class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :project
      t.references :page

      t.timestamps
    end
    add_index :tasks, :project_id
    add_index :tasks, :page_id
  end
end
