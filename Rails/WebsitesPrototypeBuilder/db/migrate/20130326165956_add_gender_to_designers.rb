class AddGenderToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :gender, :string
  end
end
