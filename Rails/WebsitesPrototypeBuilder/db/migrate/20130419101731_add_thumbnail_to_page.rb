class AddThumbnailToPage < ActiveRecord::Migration
  def change
  	add_column :pages, :thumbnail, :string
  end
end
