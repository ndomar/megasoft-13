#encoding: utf-8
  ##
  # each instance of this model represents a task that belongs to one project
  #* *Attributes*    :
  #   -+name+ -> name of the task (string)
  #   -+description+ -> description of task (text)
  #* *Relations*    :
  #   -belongs to one project 
  #   -belongs to one page 
  #   -has many task results 
  #   -has a many to many relationship with reviewers
class Task<ActiveRecord::Base

  attr_accessible :description, :name, :page_id, :time_limit, :requires_reviewer_info, :project_id, :final_step

  belongs_to :project
  belongs_to :page
  has_many :steps
  has_many :task_results
  has_and_belongs_to_many :reviewers

  validates :name, :time_limit, :description, :presence => true
  validates :time_limit, :numericality => true
  validates :project, :presence => true

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
      @step_answer.task_result_id=task_result_id
      @step_answer.save

      @task_result= self.task_results.find(task_result_id)
      @task_result.clicks= params[:change_clicks]
      @task_result.time=params[:total_time_taken]
      @task_result.save

      @step_answer.reviewer_id=@task_result.reviewer_id
      @step_answer.save
      
      @page= Page.find(1)
      hash = Hash.new
      hash = {:step => @step, :page => @page, :step_answer => @step_answer , :task_result => @task_result}
    end  
  end
end

