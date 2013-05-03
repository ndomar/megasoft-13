class AddPageToProjectRelation < ActiveRecord::Migration
  def change
    add_column :pages, :project_id, :integer    
  end
end