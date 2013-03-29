class AddPhoneNumberToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :phone_number, :int
  end
end
