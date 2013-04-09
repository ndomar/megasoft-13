class CreateQquestions < ActiveRecord::Migration
  def change
    create_table :qquestions do |t|
      t.text :body
      t.integer :number
      t.integer :q_type
      t.references :questionnaire
      t.references :project

      t.timestamps
    end
    add_index :qquestions, :questionnaire_id
    add_index :qquestions, :project_id
    Qquestion.create(:body => "What do you think answer text field??!!", :number => "2", :q_type => "1", :questionnaire_id => "1")
    Qquestion.create(:body => "radio button shoudl come 1st??!!", :number => "1", :q_type => "2", :questionnaire_id => "1")
  end
end
