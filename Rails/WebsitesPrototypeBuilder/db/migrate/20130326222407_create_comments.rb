class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :page_id
      t.integer :reviewer
      t.text :assigned_part
      t.text :body

      t.timestamps
    end
  end
end
