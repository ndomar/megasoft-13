class Invitation < ActiveRecord::Base
  attr_accessible :expiry_date, :invitation_link, :invitation_text, :reviewer_id, :status, :task_id
end
