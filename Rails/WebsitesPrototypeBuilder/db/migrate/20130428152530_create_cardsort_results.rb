class CreateCardsortResults < ActiveRecord::Migration
  def change
    create_table :cardsort_results do |t|
      t.integer :cardsort_id

      t.timestamps
    end
  end
end
