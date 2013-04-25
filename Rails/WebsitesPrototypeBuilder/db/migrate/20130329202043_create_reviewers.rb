<<<<<<< HEAD
class CreateReviewers < ActiveRecord::Migration
  
  def change
    create_table :reviewers do |t|
      t.string :email

      t.timestamps
    end
  end
  
end
=======
class CreateReviewers < ActiveRecord::Migration
  
  def change
    create_table :reviewers do |t|
      t.string :email

      t.timestamps
    end
  end
end
>>>>>>> aefe189d8c13025eb7d930b281cae395caf1b23a
