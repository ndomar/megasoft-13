class Task<ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :project
  belongs_to :page
  has_many :steps
  has_many :task_results
  has_and_belongs_to_many :reviewers
 
  has_many :steps

  validates :name, :presence => true

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

  def update_taskResults(params,task_result_id)
    if params[:change_id].to_f <= self.steps.last.id.to_f
      @step=self.steps.find(params[:change_id])
      @pre_step = self.steps.find(params[:change_id].to_f-1)
      @step_answer=@pre_step.step_answers.new
      @step_answer.successful= params[:change_success]
      @step_answer.time_from_start= params[:start_time]
      @step_answer.save

      @task_result= self.task_results.find(task_result_id)
      @task_result.clicks= params[:change_clicks]
      @task_result.time=params[:total_time_taken]
      @task_result.save
      
      @page= Page.find(1)
      hash = Hash.new
      hash = {:step => @step, :page => @page, :step_answer => @step_answer , :task_result => @task_result}
    end  
  end
end


  validates :name, :presence => true
end
 
