class CreateReviewerTaskJoinTable < ActiveRecord::Migration
  def change
  	create_table :reviewers_tasks, :id => false do |table|
  		table.integer :reviewer_id
  		table.integer :task_id
  	end
  end
end
