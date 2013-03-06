class Comment < ActiveRecord::Base
  belongs_to :blogpost
  belongs_to :user

  validates :text, :presence => true,
  				   :length => {:minimum => 5}
end
