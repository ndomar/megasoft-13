class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :status
      t.number :reviewer_id

      t.timestamps
    end
  end
end
