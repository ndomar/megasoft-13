##
# It represents the designer of a project in the database
# * *Attribute*    :
#   - +country+ -> designer's country
#   - +credit_card_number+ -> designer's credit card number
#   - +designer_name+ -> designer's name
#   - +email+ -> designer's email
#   - +facebook_id+ -> designer's facebook ID
#   - +max_size+ -> 
#   - +phone_number+ -> designer's phone number
#   - +profession+ -> designer's profession
#
class Designer < ActiveRecord::Base
  attr_accessible :country, :credit_card_number, :designer_name, :email, :facebook_id, :max_size, :phone_number, :profession
end
