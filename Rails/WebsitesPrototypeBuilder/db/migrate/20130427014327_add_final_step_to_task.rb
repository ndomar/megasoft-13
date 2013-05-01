class AddFinalStepToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :final_step, :integer
  end
end
