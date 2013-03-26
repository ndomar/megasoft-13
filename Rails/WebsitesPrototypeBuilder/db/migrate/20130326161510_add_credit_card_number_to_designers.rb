class AddCreditCardNumberToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :credit_card_number, :integer
  end
end
