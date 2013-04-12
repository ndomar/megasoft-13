class AddDesignerDetails < ActiveRecord::Migration
  
  #add needed columns to designer
  def change
  	add_column :designers, :fullname, :string
  	add_column :designers, :phone_number, :string
  	add_column :designers, :country, :string
  	add_column :designers, :day_dob, :integer
  	add_column :designers, :month_dob, :integer
  	add_column :designers, :year_dob, :integer
  	add_column :designers, :credit_card_number, :integer
  	add_column :designers, :cvv2, :integer
  	add_column :designers, :profession, :string
  	add_column :designers, :facebook_email, :string
  	add_column :designers, :gender, :string
  	add_column :designers, :rpx_identifier, :string
  end

end