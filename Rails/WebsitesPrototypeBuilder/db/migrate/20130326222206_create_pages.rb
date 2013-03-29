class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :html_markup

      t.timestamps
    end
  end
end
