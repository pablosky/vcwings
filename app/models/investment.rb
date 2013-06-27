class Investment < ActiveRecord::Base


include PublicActivity::Model

  belongs_to :user
  belongs_to :startup
  attr_accessible :vcmoney
end
