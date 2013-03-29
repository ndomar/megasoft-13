class Invitation < ActiveRecord::Base
  attr_accessible :expired, :expiry_date, :invitation_link, :invitation_text, :status
end
