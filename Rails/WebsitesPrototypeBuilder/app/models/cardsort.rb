##
# It represents a cardsorting event in the database
# * *Attribute*    :
#   - +description+ -> describes the cardsort
#   - +open+ -> states if the this cardsort is an open system
#   - +title+ -> the name of the cardsort
# * *Relations* :

#   - has many to one relation with model project
#   - has one to many relation with model card
#   - has one to many relation with model group
#
class Cardsort < ActiveRecord::Base
  attr_accessible :description, :open, :project_id, :title

  has_many :cards
  has_many :groups
end
