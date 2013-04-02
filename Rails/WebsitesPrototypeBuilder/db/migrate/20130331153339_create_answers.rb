class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :page
      t.references :comment

      t.timestamps
    end
    add_index :answers, :page_id
    add_index :answers, :comment_id
  end
end
