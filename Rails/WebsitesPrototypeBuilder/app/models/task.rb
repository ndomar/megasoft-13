class Task<ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :project
  belongs_to :page
  has_many :task_results
  has_and_belongs_to_many :reviewers
  validates :name, :presence => true

  STATUS = {
    pending: 0,
    done: 1,
    expired: 3
  }

  ##
  # send a task invitation to specified email
  # create the reviewer if not already existant
  # * *Args* :
  # - +email+ -> the current page
  # - +msg+ -> custom message for the email
  # - +url+ -> url to take the invitation
  # * *Returns* :
  # - void
  #
  def send_invitation(email, msg, url)
    @reviewer = Reviewer.find_by_email(email)
    if @reviewer == nil
      @reviewer = self.reviewers.create(:email => email) 
    end
    ReviewerInviter.task_invitation(email, msg, url).deliver()
  end
  
  ##
  # gets the status of the reviewer, either reviewed, awaiting review or expired
  # * *Args* :
  # - +@reviwer_id_+ -> reviewer id to get the status
  # * *Returns* :
  # - status code indication the status of the invitation
  #
  def check_invitation_status(reviewer_id)
    reviewer = self.reviewers.find(reviewer_id)
    if reviewer.task_result.nil?
      :pending
    else
      :done
  end
end
