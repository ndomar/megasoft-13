class ReviewerInfo < ActiveRecord::Base
  attr_accessible :age, :country, :day_of_birth, :gender, :month_of_birth, :reviewer_name, :year_of_birth
end
