class CreateCardsorts < ActiveRecord::Migration

  def change
    create_table :cardsorts do |t|
      t.string :title
      t.text :description
      t.integer :project_id
      t.boolean :open

      t.timestamps
    end
  end
  
end
