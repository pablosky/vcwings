class Album < ActiveRecord::Base
  belongs_to :activity
  has_many :photos
  attr_accessible :name
end
