class AddHtmlColumnToPages < ActiveRecord::Migration
  def change
    add_column :pages, :html, :text
  end
end
