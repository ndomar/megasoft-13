class AddRpxIdentifierToDesigners < ActiveRecord::Migration
  def change
  	add_column :designers, :rpx_identifier, :string
  end
end
