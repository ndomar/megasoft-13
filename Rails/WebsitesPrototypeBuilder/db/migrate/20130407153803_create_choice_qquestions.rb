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
    # Choice_qquestion.create(:body => "answer 1", :number => "1", :questionnaire_id => 1,:qquestion_id => 2)
    # Choice_qquestion.create(:body => "answer 2", :number => "2", :questionnaire_id => 1,:qquestion_id => 2)
    # Choice_qquestion.create(:body => "answer 3", :number => "2", :questionnaire_id => 1,:qquestion_id => 1)
  end
end
