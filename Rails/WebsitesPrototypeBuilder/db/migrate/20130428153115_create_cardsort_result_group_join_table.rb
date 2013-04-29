class CreateCardsortResultGroupJoinTable < ActiveRecord::Migration
  def change
    create_table :cardsort_results_groups, :id => false do |t|
      t.integer :cardsort_result_id
      t.integer :group_id
    end
  end
end
