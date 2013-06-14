class Photo < ActiveRecord::Base
  belongs_to :album
  attr_accessible :avatar, :description, :name
end
