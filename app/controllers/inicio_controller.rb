class InicioController < ApplicationController


#layout "index"

def show

	if signed_in?

	 redirect_to '/dashboard'

	else
		@s = Startup.count
		@e = User.count

		@startups = Startup.last(12)
	end


end


end


