##
# represents a cardsort entity
# * *Attribute* :
#  - +description+ -> a short desciption of the card sort and its purpose
#  - +open+ -> boolean to set the type of the cardsort
#  - +project_id+ -> the project the cardsort belongs to
#  - +title+ -> the name of the cardsort
#  * *Relations* :
#  - belongs to project
#
class Cardsort < ActiveRecord::Base
  attr_accessible :description, :open, :project_id, :title
  has_many :cards
end
