class Designer < ActiveRecord::Base
  has_many :projects #The designer has one to many projects
  attr_accessible :country, :credit_card_number, :email, :facebook_id, :phone_number, :user_name
end
