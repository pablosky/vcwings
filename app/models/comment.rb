class Comment < ActiveRecord::Base
  belongs_to :startup
  attr_accessible :body, :commenter ,:startup_id
end
