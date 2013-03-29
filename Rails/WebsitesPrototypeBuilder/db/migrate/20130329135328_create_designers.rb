class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :designer_name
      t.string :email
      t.int :facebook_id
      t.string :credit_card_number
      t.string :phone_number
      t.string :country
      t.string :profession
      t.int :max_size

      t.timestamps
    end
  end
end
