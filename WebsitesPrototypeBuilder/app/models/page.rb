class Page < ActiveRecord::Base
  attr_accessible :html_markup
  # set it to contain many comments
  has_many :comments
  # set it to contain many questions
  has_many :questions

end
