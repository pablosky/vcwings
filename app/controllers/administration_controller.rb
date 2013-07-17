class AdministrationController < ApplicationController


def index


end

def plata


  Profile.update_all(:wallet => 20000)

  redirect_to "/profiles"

	
end




end
