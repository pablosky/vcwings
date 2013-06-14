class ProfilesController < ApplicationController

before_filter :authorize , except: [:show]

def index

  @profiles = Profile.all

end

def new 

 @profile = Profile.new

end	

def create	

@user = current_user
@profile = Profile.new(params[:profile])	
@profile.wallet = 40000

if @profile.save

## poner en cero todo lo de user badge



redirect_to @profile
else

flash[:notice] = "You already have a profile"
      redirect_to dashboard_path 

end

		

end	

def show


@profile = Profile.find(params[:id])
     

end

def edit

  

  @profile = Profile.find_by_user_id(params[:id])
 
 end

  def update
     @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      redirect_to @profile
    else
      render :new
    end
  end

def myprofile




  @profile = Profile.find_by_user_id(params[:id])

   if @profile == nil
   
     flash[:notice] = "You have no profile please create one"
     redirect_to new_profile_path(@profile) 
   
   elsif @profile.user_id != current_user.id

    flash[:notice] = "You only can access to ur profile!"
    redirect_to dashboard_path

  end
  

     
 
  
end



def subida

render :uploadphoto
@profiles = Profile.find_by_user_id(params[:id])

end

def uploadphoto

@profiles = Profile.find_by_user_id(params[:id])



#@profile.avatar = params[:avatar]
#@profile.avatar = File.open('somewhere')



#@profile.save!
#@profile.avatar.url # => '/url/to/file.png'
#@profile.avatar.current_path # => 'path/to/file.png'
#@profile.avatar.identifier # => 'file.png'


redirect_to @profile


end

end
