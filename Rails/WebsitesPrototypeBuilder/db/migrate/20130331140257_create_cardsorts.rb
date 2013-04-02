class CreateCardsorts < ActiveRecord::Migration
  def change
    create_table :cardsorts do |t|
      t.string :title
      t.text :description
      t.boolean :open
      t.integer :project_id

      t.timestamps
    end
  end
end
