class Investment < ActiveRecord::Base
  belongs_to :user
  belongs_to :startup
  attr_accessible :vcmoney
end
