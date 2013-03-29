class AddFacebookEmailToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :facebook_email, :string
  end
end
