class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
      t.string :title
      t.text :content
      t.references :user_blog

      t.timestamps
    end
    add_index :blogposts, :user_blog_id
  end
end
