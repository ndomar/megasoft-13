class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :invitation_text
      t.string :invitation_link
      t.datetime :expiry_date
      t.boolean :expired
      t.boolean :status

      t.timestamps
    end
  end
end
