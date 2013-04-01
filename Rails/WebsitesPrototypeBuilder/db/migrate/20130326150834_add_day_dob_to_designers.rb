class AddDayDobToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :day_dob, :integer
  end
end
