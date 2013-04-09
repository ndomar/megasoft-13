class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :body
      t.integer :number
      t.references :qquestion

      t.timestamps
    end
    add_index :choices, :qquestion_id
  end
end
