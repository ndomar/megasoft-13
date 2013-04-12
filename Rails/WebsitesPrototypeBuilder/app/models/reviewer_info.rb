  ##
  # each instance of this model represents the information of one reviewer
  #* *Attributes*    :
  #   -+age+ -> age of the reviewer
  #   -+country+ -> country of the reviewer
  #   -+gender+ -> gender of the reviewer
  #   -+name+ -> name of the reviewer
  #   -+day_of_birth+ -> day of birth of reviewer
  #   -+month_of_birth+ -> month of birth of reviewer
  #   -+year_of_birth+ -> year of birth of reviewer
  #* *Relations*    :
class ReviewerInfo < ActiveRecord::Base
  attr_accessible :age, :country, :day_of_birth, :gender, :month_of_birth, :name, :year_of_birth
end
