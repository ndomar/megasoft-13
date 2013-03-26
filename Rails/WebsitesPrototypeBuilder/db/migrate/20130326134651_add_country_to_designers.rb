class AddCountryToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :country, :string
  end
end
