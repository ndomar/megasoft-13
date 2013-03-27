class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.references :designer
      t.string :project_type
      t.text :description

      t.timestamps
    end
    add_index :projects, :designer_id
  end
end
