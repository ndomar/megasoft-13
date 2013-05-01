class AddReviewerIdToCardSortResults < ActiveRecord::Migration
  def change
    add_column :cardsort_results, :reviewer_id, :integer
  end
end
