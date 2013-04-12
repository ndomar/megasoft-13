##
# It represents the rest of the reviewer's info in the database
# * *Attribute*    :
#   - +age+ -> reviewer's age
#   - +country+ -> reviewer's country
#   - +day_of_birth+ -> reviewer's day of birth
#   - +gender+ -> reviewer's gender
#   - +month_of_birth+ -> reviewer's month of birth
#   - +name+ -> reviewer's name
#   - +year_of_birth+ -> reviewer's year of birth
#
class ReviewerInfo < ActiveRecord::Base
  attr_accessible :age, :country, :day_of_birth, :gender, :month_of_birth, :name, :year_of_birth
end
