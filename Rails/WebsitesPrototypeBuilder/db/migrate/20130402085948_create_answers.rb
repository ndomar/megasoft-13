class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :question
      t.references :page

      t.timestamps
    end
    add_index :answers, :question_id
    add_index :answers, :page_id
  end
end
