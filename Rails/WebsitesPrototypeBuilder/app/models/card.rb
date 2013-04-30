# encoding: utf-8 

##
# represents a card in the card sortign system 
# in the card sorting system
# * *Attribute* :
# - +title+ -> string representing the id the name of the card
# - +description+ -> string descriping the card
#* *Relations* :
# - belongs to one cardsort
#
class Card < ActiveRecord::Base
  attr_accessible :cardsort_id, :description, :group_id, :title

  validates :title, :presence =>  { :message => "اسم البطاقة لا يمكن ان يكون خاليا"},
 					:uniqueness => {:scope => :cardsort_id, :message => "%{value} موجود بالفعل"} 
  validates :cardsort_id, :presence => true
  has_many :cardsort_results
  belongs_to :cardsort
  has_and_belongs_to_many :groups

end
