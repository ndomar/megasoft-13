class AddCardAndGroupIdsToCardSortResults < ActiveRecord::Migration
  def change
    add_column :cardsort_results, :card_id, :integer
    add_column :cardsort_results, :group_id, :integer
  end
end
