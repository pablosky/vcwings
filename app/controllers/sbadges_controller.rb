class SbadgesController < ApplicationController

def index

@badges =Sbadge.all

end

def new

@badge = Sbadge.new

end

def create

@rate = Sbadge.new
@rate = Sbadge.find_by_startup_id(params[:startup_id])

if @rate == [] 

 redirect_to 'game'

else

  redirect_to 'dashboard'

end 
# if @rate == []

#   @rate = Sbadge.new
#   @rate.namecounter =:namecounter
#   @rate.startup_id = :startup_id
#   #:feedbackcounter, :logocounter, :moneycounter, :namecounter, :textpitchcounter, :videocounter, :visitcounter, :websitecounter
  
#   redirect_to 'game'

# else

#   @rate.namecounter = @rate.namecounter + :name 

#    redirect_to 'game'

# end

end



end
