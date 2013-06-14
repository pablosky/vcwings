class ActivitiesController < ApplicationController


before_filter :authorize , except: [:show]
 def index

    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

def startupacts
	
 @activities = Activity.find_by_startup_id(params[:id])


end


def new 
 
  
 @activities = Activity.new
 @startups= Startup.find(params[:startup_id])
 
 end


 def create

  @startups= Startup.find(params[:startup_id])
  @activity = Activity.new(params[:activity])

  @activity.startup_id = @startups.id

  if @activity.save

  redirect_to @startups

  else

  render "new"
  
  end 

 end


end
