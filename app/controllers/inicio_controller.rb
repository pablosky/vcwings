class InicioController < ApplicationController


#layout "index"

def show


@s = Startup.count
@e = User.count

@startups = Startup.last(6)



end

def index

end

end
