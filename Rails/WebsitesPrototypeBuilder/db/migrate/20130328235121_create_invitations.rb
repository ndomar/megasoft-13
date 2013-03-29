class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :task
      t.references :reviewer
      t.integer :status

      t.timestamps
    end
    add_index :invitations, :task_id
    add_index :invitations, :reviewer_id
  end
end
