class MembersController < ApplicationController
  # GET /members
  # GET /members.json

  before_filter :authorize , except: [:show]

  autocomplete :profiles, :column_name => 'fullname',  :full => true 
  
  def index

    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end

  end

  def show 

    #@member =Member.find(params[:id])

    @member = Member.new
   

  end

  def _member
   
   @member = Member.new


  end

  def new 
  
  
 @members = Member.new
 @startups= Startup.find(params[:startup_id])
 
 end


 def create

  @startups= Startup.find(params[:startup_id])

  @member = Member.new(params[:member])

  @profile = Profile.find_by_email(@member.email)

  @member.startup_id = @startups.id

  @member.user_id = @profile.user_id

  @member.profile_id = @profile.id

  @member.name = @profile.fullname

  if @member.save

  redirect_to @startups

  else

  render "new"
  
  end 

 end


 


 def edit

  @members = Member.find(params[:id])
  @startups =Startup.find(@members.startup_id)


 end 


 def update


   @members = Member.find(params[:id])
   @startups =Startup.find(@members.startup_id)

    if @members.update_attributes(params[:members])
      redirect_to @startups
    else
      render :edit
    end


 end

def destroy

     
@member = Member.find(params[:id])    
@member.destroy
redirect_to "/startups/mystartups/#{current_user.id}"
end

end