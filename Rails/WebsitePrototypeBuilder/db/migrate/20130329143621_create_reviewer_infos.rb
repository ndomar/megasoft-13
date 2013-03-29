class CreateReviewerInfos < ActiveRecord::Migration
  def change
    create_table :reviewer_infos do |t|
      t.string :reviewer_name
      t.integer :age
      t.boolean :gender
      t.integer :day_of_birth
      t.integer :month_of_birth
      t.integer :year_of_birth
      t.string :country

      t.timestamps
    end
  end
end
