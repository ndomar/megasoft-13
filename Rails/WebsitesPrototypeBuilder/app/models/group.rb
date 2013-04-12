class Group < ActiveRecord::Base
  attr_accessible :cardsort_id, :description, :title

  belongs_to :cardsort

  validates :title, :presence => true,
  									:uniqueness => {:scope => :cardsort_id}
  validates :cardsort_id, :presence => true
end
