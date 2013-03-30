class AddMonthDobToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :month_dob, :integer
  end
end
