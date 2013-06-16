class DashboardController < ApplicationController

before_filter :authorize

 
 def show



 end

 def index


  @startups = Startup.order("random()").last(3)
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





end
