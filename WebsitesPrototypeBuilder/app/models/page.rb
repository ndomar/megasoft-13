class Page < ActiveRecord::Base
  attr_accessible :html_markup
  # set it to contain many comments, when deleted delete all related comments
  has_many :comments,:dependent => :destroy
  # set it to contain many questions, when deleted delete all related questions
  has_many :questions,:dependent => :destroy

end
