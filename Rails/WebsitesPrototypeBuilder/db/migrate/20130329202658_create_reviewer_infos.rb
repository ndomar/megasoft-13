class CreateReviewerInfos < ActiveRecord::Migration
  
  def change
    create_table :reviewer_infos do |t|
      t.string :name
      t.integer :age
      t.boolean :gender
      t.string :country
      t.integer :day_of_birth
      t.integer :month_of_birth
      t.integer :year_of_birth
      t.integer :reviewer_id

      t.timestamps
    end
  end
  
end
