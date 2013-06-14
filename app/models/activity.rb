class Activity < ActiveRecord::Base
  belongs_to :startup
  has_many :albums
  attr_accessible :day, :description, :name

  
end
