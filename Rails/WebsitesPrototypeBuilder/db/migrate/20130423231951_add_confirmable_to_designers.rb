class AddConfirmableToDesigners < ActiveRecord::Migration
  def change
  	  add_column :designers, :confirmation_token, :string
      add_column :designers, :confirmed_at, :datetime
      add_column :designers, :confirmation_sent_at, :datetime
      add_column :designers, :unconfirmed_email, :string
  end
end