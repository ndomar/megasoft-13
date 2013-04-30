class CreateGroups < ActiveRecord::Migration

  def change
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.integer :cardsort_id

      t.timestamps
    end
  end
  
end
