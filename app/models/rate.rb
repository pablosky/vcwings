class Rate < ActiveRecord::Base
  belongs_to :user
  belongs_to :startup
  attr_accessible :idea, :logo, :name, :text, :video, :website
end
