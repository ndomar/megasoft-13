class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.text :invitation_text
      t.text :invitation_link
      t.datetime :expiry_date
      t.integer :status
      t.integer :reviewer_id
      t.integer :task_id

      t.timestamps
    end
  end
end
