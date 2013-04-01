class Designer < ActiveRecord::Base
  attr_accessible :country, :credit_card_number, :designer_name, :email, :facebook_id, :max_size, :phone_number, :profession

  #Associations
  has_many :projects
  
end
