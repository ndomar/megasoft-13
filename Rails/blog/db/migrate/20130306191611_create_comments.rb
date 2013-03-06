class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :blogpost

      t.timestamps
    end
    add_index :comments, :blogpost_id
  end
end
