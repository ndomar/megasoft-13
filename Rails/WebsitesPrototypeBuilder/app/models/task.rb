class Task<ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project
  
  belongs_to :page

  has_many :task_results
  has_and_belongs_to_many :reviewers

  validates :name, :presence => true

  def invite
    #Sends an email to a new/already existing reviewer with an invitation link to take the desired task.
    
  end

  def self.send_invitation(email, msg, url)
      @reviewer = Reviewer.find_by_email(email)
      if @reviewer == nil
        @reviewer = Reviewer.create(:email => email) 
      end
      Invitation.send_invitation(@reviewer, params[:invitation_message], task_path(:task_id => 1, :reviewer_id => @reviewer.id))
      params[:invitation_email] = "Email sent to " + @reviewer.email 
    end
    #Sends an invitation to a reviewer with content (msg) and invitation link (url).
  	ReviewerInviter.task_invitation(reviewer.email, msg, url).deliver()
  	inv = Invitation.create(:status => STATUS[:pending])
    inv.reviewer = reviewer
    inv.save
  end
end