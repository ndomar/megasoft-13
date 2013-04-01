class AddDesignerNameToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :designer_name, :string
  end
end
