class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :title
      t.references :project

      t.timestamps
    end
    add_index :questionnaires, :project_id
    Questionnaire.create(:title => "1st questionnaire")
  end
end
