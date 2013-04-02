class Designer < ActiveRecord::Base
  has_many :projects
  attr_accessible :country, :credit_card_number, :designer_name, :email, :facebook_id, :max_size, :phone_number, :profession

end
