class Comment < ActiveRecord::Base
  belongs_to :blogpost
  belongs_to :user

  # validates :text, :presence => true,
  # 				   :legth => {:minimum => 5}
  # Validation works but showing the errors doesnt will work on it

end
