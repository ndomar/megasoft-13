class CreateReviewers < ActiveRecord::Migration
  
  def change
    create_table :reviewers do |t|
      t.string :email
      t.integer :task_id

      t.timestamps
    end
  end
  
end
