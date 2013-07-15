class DashboardController < ApplicationController

before_filter :authorize

 
 def show



 end

 def index


  @startups = Startup.order("random()").last(3)
  @members = Member.where(user_id: current_user.id)# DONDE PERTENEZCO


  @startups_ids = @members.collect(&:startup_id) #LAS STARTUPS DONDE PERTENEZCO
 
  @comments = Comment.where(startup_id: @startups_ids) #LOS COMENTARIOS A MIS STARTUPS

  @comments_ids = @comments.collect(&:id) #LOS IDS DE LOS COM

  #@startups = Startup.find(@startups_ids)

  #@activities = PublicActivity::Activity.find_by_trackable_id(@comments_ids)#LAS ACTIVIDADES RELACIONADAS CON ESOS COMENTARIOS
   
  
  @activities = PublicActivity::Activity.where(trackable_id: @comments_ids )

  

  # me guarda la id del comentario trackable_id y del user owner

if (@activities == [] || @activities == nil)

    @activities = nil
    flash[:notice] = "no activities to show"  #puede ser mejorado mostrando en el momento de invertir mostrar la billetera
      redirect_to dashboard_path 
   

  end











  
  render :show

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



def plata


  Profile.update_all(:wallet => 20000)

  redirect_to "/profiles"

	
end

def game

@startups = Startup.order("random()").last(3)

@investments = Investment.new

end





end
