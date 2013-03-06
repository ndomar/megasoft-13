class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :blogpost
      t.references :user

      t.timestamps
    end
    add_index :comments, :blogpost_id
    add_index :comments, :user_id
  end
end
