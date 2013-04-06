##
# It represents groups of a cardsorting event in the database
# * *Attribute*    :
#   - +description+ -> describes the group
#   - +title+ -> the name of the group
# * *Relations* :

#   - has many to one relation with model cardsort
#   - has one to many relation with model card
#
 class Group < ActiveRecord::Base
  attr_accessible :cardsort_id, :description, :title

  belongs_to :cardsort
  has_many :cards

## 
#This method finds all groups belonging to a certain cardsort
# * *Args*    :
#none
# * *Returns* :
#   none
#
  def find
    @cardsort = Cardsort.find(params[:cardsort_id])
    @group = @cardsort.groups.find(:all)
    redirect_to group_path(@group)
   end

end
