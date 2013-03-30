class ChangePhoneNumberFormatInDesigners < ActiveRecord::Migration
  def self.up
   change_column :designers, :phone_number, :string
  end

  def self.down
   change_column :designers, :phone_number, :int
  end
end
