class AddUsernameToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :username, :string
  end
end
