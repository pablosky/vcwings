class Sbadge < ActiveRecord::Base
  belongs_to :startup
  attr_accessible :feedbackcounter, :logocounter, :moneycounter, :namecounter, :textpitchcounter, :videocounter, :visitcounter, :websitecounter
end
