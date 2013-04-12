class AddReviewerIdToReviewerInfos < ActiveRecord::Migration
  def change
    add_column :reviewer_infos, :reviewer_id, :integer
  end
end
