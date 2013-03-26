class Projectt < ActiveRecord::Base
  belongs_to :designer

  attr_accessible :name, :type, :description
end
