class Cardsort < ActiveRecord::Base
  attr_accessible :description, :open, :project_id, :title

  has_many :cards
end
