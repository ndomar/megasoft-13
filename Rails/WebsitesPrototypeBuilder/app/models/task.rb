class Task<ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :project
  belongs_to :page
  has_many :task_results
  has_and_belongs_to_many :reviewers
  validates :name, :presence => true
  
  #send the message and the url to solve a ask to the action mailer to be sent  to 
  #the user by email 
  #* *Args*    :
  #   -+email+->: the email of the user as string
  #   -+messege+->: a message to be sent to the users in the invitation as string
  #   -+url+->: a url of the to open the task and solve it a string
  #* *Returns*    :
  #   -sends the three args to the task mailer

  ##
  # send a task invitation to specified email
  # create the reviewer if not already existant
  # * *Args* :
  #   - +email+ -> the current page
  #   - +msg+ -> custom message for the email
  #   - +url+ -> url to take the invitation
  # * *Returns* :
  #   - void

  def send_invitation(email, msg, url)
    @reviewer = Reviewer.find_by_email(email)
    if @reviewer = nil
      @reviewer = self.reviewers.create(:email => email) 
    end
    ReviewerInviter.task_invitation(email, msg, url).deliver()
  end
end
