class AddCvv2ToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :cvv2, :integer
  end
end
