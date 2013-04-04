class CreatePages < ActiveRecord::Migration
  def change
    alter_table :pages do |t|
      t.string :page_name
      t.text :html

      t.timestamps
    end
  end
end
