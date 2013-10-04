class StartupsController < ApplicationController

before_filter :authorize, except: [:show] 

def index

    
     @startups = Startup.search(params[:search])
   end



  def new
  

     @profile = Profile.find_by_user_id(current_user.id)

   if @profile == nil
   
     flash[:notice] = "You have no profile please create one before creating a startup"
     redirect_to new_profile_path(@profile) 
    
    else 

    @startup = Startup.new
  
  end

  end

  def show
   
   if @startup = Startup.find(params[:id])


   else

    redirect_to dashboard_path

  end
    
  end

  def create

    @startup  = Startup.new(params[:startup])
    @startup.vmoney = 0 


    #CHEQUEO DE PERFIL


    @profile = Profile.find_by_user_id(current_user.id)

   if @profile == nil
   
     flash[:notice] = "You have no profile please create one please create one before creating a startup"
    redirect_to new_profile_path(@profile) 

   #hay q inicializar el vmoney si
   
   else


    if @startup.save 

      #agregar el member
      @member = Member.new
      @member.mtype = "founder"
      @member.job ="CEO"


      
     
      @member.email = @profile.email
      @member.name = @profile.fullname
      @member.profile_id =@profile.id
      @member.startup_id = @startup.id
      @member.user_id = current_user.id
      @member.save
      redirect_to @startup
    else
      flash[:notice] = "Fill the needed data"  #puede ser mejorado mostrando en el momento de invertir mostrar la billetera
      redirect_to dashboard_path 
   
    end #fin del grabado



end # fin de ciclo para crear






  end


def todo

@startup = Startup.all

end



def search

 
 
end





def edit 


  @startup = Startup.find(params[:id])
  
     
end




def update
    
    @startup = Startup.find(params[:id])
    
    if @startup.update_attributes(params[:startup])
       @investment.create_activity :update , owner: @profile 
      redirect_to @startup
    else
      render :edit
    end


end



def destroy
 @startup = Startup.find(params[:id])
    @startup.destroy
redirect_to :dashboard
    #respond_to do |format|
     # format.html { redirect_to dashboard_url }
      #format.json { head :no_content }
#end
end


def mystartups

  

  #@members = Member.find_by_user_id(params[:id])
 # @startups =Startup.find(@members.startup_id)
  
@members = Member.where("user_id = ?", params[:id])

@startups_ids = @members.collect(&:startup_id)

@startups = Startup.find(@startups_ids)


end






 def showguest





 end




 def feedback


@startupf = Startup.new

@startupf.posvideo = :posvideo





 end


 




end