class Task < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project

  has_many :invitaions

  validates :name, :presence => true
end
