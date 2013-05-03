class AddPageIdToStep < ActiveRecord::Migration
  def change
    add_column :steps, :page_id, :integer
  end
end
