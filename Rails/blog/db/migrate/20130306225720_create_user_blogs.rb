class CreateUserBlogs < ActiveRecord::Migration
  def change
    create_table :user_blogs do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :user_blogs, :user_id
  end
end
