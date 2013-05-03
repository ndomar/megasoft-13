class CardsortReviewerJoinTable < ActiveRecord::Migration
  def change
    create_table :cardsorts_reviewers, :id => false do |t|
      t.integer :cardsort_id
      t.integer :reviewer_id
    end
  end
end
