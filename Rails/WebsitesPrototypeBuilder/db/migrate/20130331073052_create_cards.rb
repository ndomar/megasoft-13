class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.integer :cardsort_id
      t.integer :group_id

      t.timestamps
    end
  end
end
