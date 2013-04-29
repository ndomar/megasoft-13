class CreateCardGroupJoinTable < ActiveRecord::Migration
  def change
    create_table :cards_groups, :id => false do |t|
      t.integer :card_id
      t.integer :group_id
    end
  end
end
