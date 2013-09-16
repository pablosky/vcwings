class DashboardController < ApplicationController

before_filter :authorize

 
 def show



 end

 def index


  #comentarios a mis startups o donde soymiembro

  @members = Member.where(user_id: current_user.id)# DONDE PERTENEZCO

  @startups_ids = @members.collect(&:startup_id) #LAS STARTUPS DONDE PERTENEZCO
 
  
  @comments = Comment.where(startup_id: @startups_ids) #LOS COMENTARIOS A MIS STARTUPS

  @comments_ids = @comments.collect(&:id) #LOS IDS DE LOS COM

  #updates a las startups donde inverti
  #Model.where('cat_id=? OR color=?', 5, 'grey')

  #mis inversiones 

  @investments = Investment.where('user_id=?', current_user.id  ) 

  @investments2 = Investment.where('startup_id IN (?)', @startups_ids  )

  @investments_ids = @investments2.collect(&:id)

  @startups_in_ids = @investments.collect(&:startup_id) #las id de las sups donde inverti


  #inversiones a mis startups

   @activities = PublicActivity::Activity.where(  trackable_id: [@comments_ids , @startups_in_ids, @investments_ids ] ).order("created_at DESC")




  #@activities = PublicActivity::Activity.where(  '(trackable_id IN (?)) OR (trackable_id IN (?) AND trackable_type IN(?) ) ' ,@comments_ids, @startups_in_ids , ['Investment','Update']).order("created_at DESC")

  

if (@activities == [] || @activities == nil)

    @activities = nil
    flash[:notice] = "no activities to show"  #puede ser mejorado mostrando en el momento de invertir mostrar la billetera
    
   

  end




 


 end	


 def search

  #@search = Startup.find_by_name(params[:name]) 
  @search = Startup.search(params[:name]) #este devuelve [] vacio
 
 if  @search == nil

     flash[:snotice] = "No startups with that criteria"
     
 end	


end



def random
	#random para el juego de inversion
    @startups = Startup.order("random()").first
    
end


def admin


	
end





def game

@startups = Startup.order("random()").last(3)



@investments = Investment.new

end




def rate 

@rates = Sbadge.find_by_startup_id(params[:startup_id])



if @rates == [] || @rates = nil

 @rates = Sbadge.new(params[:sbadge]) 
 
  if @rates.save

    redirect_to dashboard_path
    flash[:notice]= "grabado"
  end
else

  redirect_to dashboard_path
  flash[:notice]="no grabado"

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
