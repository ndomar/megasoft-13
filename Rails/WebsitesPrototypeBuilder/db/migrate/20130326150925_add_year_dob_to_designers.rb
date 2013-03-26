class AddYearDobToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :year_dob, :integer
  end
end
