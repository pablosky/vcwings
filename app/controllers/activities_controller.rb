class ActivitiesController < ApplicationController
  


  def index
  
   @activities = PublicActivity::Activity.order("created_at desc")
   
     


  end


  def notificaciones


  #buscar todas las activities que se relacionen con MIS STARTUPS / INVERSIONES? POR VER
  
  #BUSCAR

  #@members = Member.where("user_id = ?", params[:id])

  #@startups_ids = @members.collect(&:startup_id)

  #@startups = Startup.find(@startups_ids)

  #@activities = PublicActivity::Activity.find_by_startup_id(@startups_ids)
   
  
  end



end
