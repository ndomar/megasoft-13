class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_type
      t.text :description

      t.timestamps
    end
  end
end
