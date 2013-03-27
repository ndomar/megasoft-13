class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :user_name
      t.string :email
      t.integer :facebook_id
      t.string :credit_card_number
      t.string :phone_number
      t.string :country

      t.timestamps
    end
  end
end
