class CommentsController < ApplicationController

#@comment.create_activity :create , :owner current_user.id

def new

 @comment  = Comment.new

end	


 def create
  
  @startup = Startup.find(params[:startup_id])
  @comment = Comment.new(params[:comment])
  @comment.like= 0
  @comment.nolike = 0
  
  ##


  ##  
 
 @comment.save

 @profile = Profile.find_by_user_id(current_user.id)
 @comment.create_activity :create , owner: @profile , recipient: @startup 
 
 redirect_to startup_path(@startup)


   
end











def like 


##usa el coment id para darle al comment database el numero / usa el commenter para buscar profile y darle los numeros de likes al user

@com = Comment.find(params[:idea])

@us = Profile.find_by_email(@com.commenter)

@badge = Ubadge.find_by_user_id (@us.id)

#unless @badge  
 # @badge = Ubadge.create(:user_id => @com.commenter , :advangel  => 0 , :earlyadapt  =>0 , :feedmaster  => 0, :ffather  =>0, :knowit =>0, :moneywise=>0, :vetinvestor=>0, :voiceofwisdom=>0)

#end

if @com.commenter == current_user.email 


flash[:notice] = "barza no te puedes autovotar"
      redirect_to dashboard_path 

##falta condicion del compadre q no sea user

#elsif @com.commenter not current_user.email 

else

@com.like = @com.like + 1

@com.save


#@badge.feedmaster = @badge.feedmaster + 1 

#@badge.voiceofwisdom =  @badge.voiceofwisdom + 1 

redirect_to startup_path(@com.startup_id)


end

end 






def nolike

@com = Comment.find(params[:ide])




if @com.commenter == current_user.email 


flash[:notice] = "barza no te puedes autovotar"
      redirect_to dashboard_path 

##falta condicion del compadre q no sea user

else

# @com.commenter != current_user.email 


@com.nolike = @com.nolike + 1

@com.save




redirect_to startup_path(@com.startup_id)

end

end


end