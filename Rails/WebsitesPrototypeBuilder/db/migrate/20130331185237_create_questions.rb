class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :page_id
      t.text :assigned_part
      t.text :body

      t.timestamps
    end
  end
end
