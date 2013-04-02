class Task < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project

  has_many :invitaions, :dependent => :destroy

  validates :name, :presence => true
end
