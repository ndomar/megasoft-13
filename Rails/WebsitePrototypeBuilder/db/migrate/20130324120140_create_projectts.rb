class CreateProjectts < ActiveRecord::Migration
  def change
    create_table :projectts do |t|
      t.string :name
      t.references :designer
      t.string :type
      t.text :description

      t.timestamps
    end
    add_index :projectts, :designer_id
  end
end
