class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :status
      t.integer :reviewer_id

      t.timestamps
    end
  end
end
