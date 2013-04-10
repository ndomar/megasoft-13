class ReviewerInfo < ActiveRecord::Base
  attr_accessible :age, :country, :day_of_birth, :gender, :month_of_birth, :name, :year_of_birth

  belongs_to :reviewer
end
