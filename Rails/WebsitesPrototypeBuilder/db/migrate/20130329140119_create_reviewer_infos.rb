class CreateReviewerInfos < ActiveRecord::Migration
  def change
    create_table :reviewer_infos do |t|
      t.string :reviewer_name
      t.int :age
      t.boolean :gender
      t.int :day_of_birth
      t.int :month_of_birth
      t.int :year_of_birth
      t.string :country

      t.timestamps
    end
  end
end
