class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.integer :question_id
      t.integer :page_id

      t.timestamps
    end
  end
end
