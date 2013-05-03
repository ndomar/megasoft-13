class CreateAnswerQuestionnaires < ActiveRecord::Migration
  def change
    create_table :answer_questionnaires do |t|
      t.text :body
      t.references :questionnaire
      t.references :qquestion
      t.timestamps
    end
    add_index :answer_questionnaires, :questionnaire_id
    add_index :answer_questionnaires, :qquestion_id
  end
end
