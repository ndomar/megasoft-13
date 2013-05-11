class AddTourTakenToDesigner < ActiveRecord::Migration
  def change
    add_column :designers, :tour_taken, :boolean
  end
end
