class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :designer_name
      t.string :email
      t.integer :facebook_id
      t.integer :credit_card_number
      t.string :phone_number
      t.string :country
      t.string :profession
      t.string :max_size

      t.timestamps
    end
  end
end
