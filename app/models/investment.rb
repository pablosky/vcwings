class Investment < ActiveRecord::Base

include PublicActivity::Common

  belongs_to :user
  belongs_to :startup
  attr_accessible :vcmoney
end
