class CreateStepAnswers < ActiveRecord::Migration
  def change
    create_table :step_answers do |t|
      t.boolean :successful
      t.time :time_from_start
      t.references :reviewer
      t.references :task_result
      t.references :step

      t.timestamps
    end
    add_index :step_answers, :reviewer_id
    add_index :step_answers, :task_result_id
    add_index :step_answers, :step_id
  end
end
