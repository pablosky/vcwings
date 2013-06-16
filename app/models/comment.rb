class Comment < ActiveRecord::Base
  

  include PublicActivity::Common
  


  belongs_to :startup
  attr_accessible :body, :commenter ,:startup_id

  


end
