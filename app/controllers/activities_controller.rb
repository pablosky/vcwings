class ActivitiesController < ApplicationController
  


  def index
  
   @activities = PublicActivity::Activity.order("created_at desc")
   
     


  end


  def notificaciones


  #buscar todas las activities que se relacionen con MIS STARTUPS / INVERSIONES? POR VER
  
  #BUSCAR

  @members = Member.where(user_id: current_user.id)# DONDE PERTENEZCO


  @startups_ids = @members.collect(&:startup_id) #LAS STARTUPS DONDE PERTENEZCO
 
  @comments = Comment.where(startup_id: @startups_ids) #LOS COMENTARIOS A MIS STARTUPS

  @comments_ids = @comments.collect(&:id) #LOS IDS DE LOS COM

  #@startups = Startup.find(@startups_ids)

  #@activities = PublicActivity::Activity.find_by_trackable_id(@comments_ids)#LAS ACTIVIDADES RELACIONADAS CON ESOS COMENTARIOS
   
  
  @activities = PublicActivity::Activity.where(trackable_id: @comments_ids )

  

  # me guarda la id del comentario trackable_id y del user owner


  end



end
