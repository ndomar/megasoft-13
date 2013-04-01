class AddProfessionToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :profession, :string
  end
end
