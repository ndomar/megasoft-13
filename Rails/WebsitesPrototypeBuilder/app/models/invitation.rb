##
# It represents an invitation sent to a certain reviewer to participate in a cardsorting event in the database
# * *Attribute*    :
#   - +expiry_date+ -> dexpiry date of the link
#   - +invitation_link+ -> the explicit link sent to the reviewer
#   - +invitaion_text+ -> the text sent along with the invitation link
#   - +reviewer_id+ -> the ID of the reviewer participating in the cardsort
#   - +status+ -> if it has expired or not
#   - +task_id+ -> the ID of the task
# * *Relations* :

#   - has many to one relation with model task
#   - has many to many relation with model reviewer
#
class Invitation < ActiveRecord::Base
  attr_accessible :expiry_date, :invitation_link, :invitation_text, :reviewer_id, :status, :task_id
end
