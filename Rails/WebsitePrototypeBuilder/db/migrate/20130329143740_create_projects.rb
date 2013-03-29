class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
