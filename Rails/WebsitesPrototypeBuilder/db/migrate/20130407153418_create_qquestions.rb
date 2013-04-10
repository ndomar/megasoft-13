class CreateQquestions < ActiveRecord::Migration
  def change
    create_table :qquestions do |t|
      t.text :body
      t.integer :qtype
      t.references :questionnaire

      t.timestamps
    end
    add_index :qquestions, :questionnaire_id
  end
end
