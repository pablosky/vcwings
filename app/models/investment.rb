class Investment < ActiveRecord::Base

include PublicActivity::Model
tracked owner: ->(controller, model) { controller && controller.current_user }


  belongs_to :user
  belongs_to :startup
  attr_accessible :vcmoney
end
