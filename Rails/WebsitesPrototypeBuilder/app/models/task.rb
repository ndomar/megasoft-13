class Task<ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project
  
  belongs_to :page

  has_many :task_results
  has_and_belongs_to_many :reviewers

  validates :name, :presence => true

  def send_invitation(email, msg, url)
    @reviewer = Reviewer.find_by_email(email)
    if @reviewer == nil
      @reviewer = this.reviewers.create(:email => email) 
    end
    ReviewerInviter.task_invitation(email, msg, url).deliver()
  end
end