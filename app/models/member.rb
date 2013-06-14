class Member < ActiveRecord::Base
  

  belongs_to :profile
  belongs_to :startup
  belongs_to :user
  
  attr_accessible :job, :mtype , :user_id ,:startup_id ,:email ,:name
end
