class InvestmentsController < ApplicationController

before_filter :authorize

def new

@investments = Investment.new

@startups = Startup.find(params[:startup_id])
 

end

def create


#IMPORTANTE AGREGAR EL CHEQUEO PARA VER CUANTA PLATA TIENE EL USER DISPONIBLE!



@startups= Startup.find(params[:startup_id])

#el chequeo 
@user = Profile.find_by_user_id(current_user.id)


# buscar usuario , compararlo con los member de la startup


@member = Member.where(:profile_id=>current_user.id , :startup_id=> @startups.id)

#chequeo de que usuario no invierta en si mismo

if @member == nil



@investment = Investment.new(params[:investment])

if @user.wallet >= @investment.vcmoney  && @investment.vcmoney >= 20000 #si el user tiene plata


     @investment.user_id = current_user.id
     @investment.startup_id = @startups.id

  



   if @investment.save

 	  @startups.vmoney +=  @investment.vcmoney

   	@startups.update_attribute(:vmoney, @startups.vmoney)
    @user.update_attribute(:wallet , @user.wallet - @investment.vcmoney )


    redirect_to @startups 

     else

    render "new"
  
     end 

  else 


   flash[:notice] = "You dont have that money check ur wallet at your profile"  #puede ser mejorado mostrando en el momento de invertir mostrar la billetera
      redirect_to dashboard_path 
   

  end

else
flash[:notice] = "Barza COMO INVIERTES EN TI MISMO!!! PIERDES 10MIL"  #puede ser mejorado mostrando en el momento de invertir mostrar la billetera
      redirect_to dashboard_path 
   
   

end #

end







def myinvestments





@my = Investment.where("user_id = ?", params[:id])

@startups_ids = @my.collect(&:startup_id)

@startups = Startup.find(@startups_ids)


end


end