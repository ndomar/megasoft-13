class Page < ActiveRecord::Base
  attr_accessible :html_markup
  has_many :comments
  has_many :questions
end
