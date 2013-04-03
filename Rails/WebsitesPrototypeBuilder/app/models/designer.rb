class Designer < ActiveRecord::Base

  attr_accessible :country, :credit_card_number, :designer_name, :email, :facebook_id, :max_size, :phone_number, :profession

  has_many :projects #The designer has one to many projects
 end
