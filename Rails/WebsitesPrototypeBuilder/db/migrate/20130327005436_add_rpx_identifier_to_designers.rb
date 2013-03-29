class AddRpxIdentifierToDesigners < ActiveRecord::Migration
 class Designer < ActiveRecord::Base
 end

 def change
  	add_column :designers, :rpx_identifier, :string
  end
end
