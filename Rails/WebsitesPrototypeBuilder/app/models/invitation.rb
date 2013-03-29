class Invitation < ActiveRecord::Base

  belongs_to :task
  belongs_to :reviewer
  attr_accessible :status, :expiry_date, :invitation_link, :invitation_text

  STATUS = {
    pending: 0,
    done: 1,
    expired: 3
  }

  def self.send_invitation(reviewer, msg, url, task)
    #Sends an invitation to a reviewer with content (msg) and invitation link (url).
    ReviewerInviter.task_invitation(reviewer.email, msg, url).deliver()
    inv = Invitation.create(:status => STATUS[:pending])
    inv.reviewer = reviewer
    inv.task = task
    inv.save

  end

  def self.get_invitation_status(reviewer_id)
    #Checks the invitation status of a reviewer by his ID.
    Invitation.find_by_reviewer_id(reviewer_id).status
  end
end
