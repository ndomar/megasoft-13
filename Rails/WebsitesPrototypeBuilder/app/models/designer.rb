class Designer < ActiveRecord::Base
	has_many :projectts

	attr_accessible  :user_name, :email, :facebook_id, :credit_card_number, :phone_number, :country
end
