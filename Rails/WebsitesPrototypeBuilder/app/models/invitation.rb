class Invitation < ActiveRecord::Base
  attr_accessible :reviewer_id, :status
  
  has_one :reviewer

  STATUS = {
  	pending: 0,
  	done: 1,
  	expired: 3
  }

  # maybe the whole reviewer should be passed
  # elemenates searching for him again when linking
  def self.send_invitation(reviewer, msg, url)
  	ReviewerInviter.task_invitation(reviewer.email, msg, url).deliver()
  	Invitation.create(STATUS[:pending])
  end

  def self.get_invitation_status(reviewer_id)
  	Invitation.find_by_reviewer_id(reviewer_id).status
  end
end
