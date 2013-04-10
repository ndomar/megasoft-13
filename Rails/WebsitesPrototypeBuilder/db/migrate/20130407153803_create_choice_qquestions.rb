class CreateChoiceQquestions < ActiveRecord::Migration
  def change
    create_table :choice_qquestions do |t|
      t.text :body
      t.integer :number
      t.references :questionnaire
      t.references :project
      t.references :qquestion

      t.timestamps
    end
    add_index :choice_qquestions, :questionnaire_id
    add_index :choice_qquestions, :project_id
    add_index :choice_qquestions, :qquestion_id
  end
end
